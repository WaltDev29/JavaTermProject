package repository;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import java.io.IOException;
import java.sql.*;
import java.time.format.DateTimeFormatter;
import java.util.*;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.regex.Pattern;
import java.util.stream.Collectors;
import java.util.regex.Matcher;

public class CrawlingMealsRepository {

    // ----------------------------------------------------
    // 1. 설정 및 SQL 쿼리 정의
    // ----------------------------------------------------
    private static final String CRAWLING_URL = "https://www.kopo.ac.kr/jungsu/content.do?menu=247";

    private static final String INSERT_MEAL_SQL =
            "INSERT INTO meals (meal_id, served_date, meal_type) VALUES (?, ?, ?)";
    private static final String INSERT_FOOD_SQL =
            "INSERT INTO foods (food_id, name) VALUES (?, ?)";
    private static final String INSERT_MEAL_FOODS_SQL =
            "INSERT INTO meal_foods (meal_id, food_id) VALUES (?, ?)";

    // [중복 체크를 위한 SQL]
    private static final String SELECT_EXISTING_FOODS_SQL =
            "SELECT food_id, name FROM foods";
    private static final String SELECT_MEAL_ID_SQL =
            "SELECT meal_id FROM meals WHERE served_date = ? AND meal_type = ?";

    // 데이터 저장을 위한 임시 구조체 (클래스 내부에 정의)
    private static class MealData {
        String servedDate;
        String mealType;
        String menuContent;

        public MealData(String servedDate, String mealType, String menuContent) {
            this.servedDate = servedDate;
            this.mealType = mealType;
            this.menuContent = menuContent;
        }
    }

    // ----------------------------------------------------
    // 2. Helper 메소드 (DB 조회)
    // ----------------------------------------------------

    /**
     * 특정 테이블에서 현재 사용된 최대 ID 값을 조회합니다.
     */
    private int getMaxId(Connection con, String tableName, String idColumnName) throws SQLException {
        // 테이블이 비어있을 경우 NULL 대신 0을 반환 (Oracle: NVL 또는 COALESCE 사용)
        String sql = String.format("SELECT COALESCE(MAX(%s), 0) FROM %s", idColumnName, tableName);

        try (Statement stmt = con.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {

            if (rs.next()) {
                return rs.getInt(1);
            }
            return 0;
        }
    }

    /**
     * 기존 foods 테이블의 모든 데이터를 Map에 로드합니다. (이름 -> ID)
     */
    private Map<String, Integer> getExistingFoods(Connection con) throws SQLException {
        Map<String, Integer> foodMap = new HashMap<>();
        try (PreparedStatement stmt = con.prepareStatement(SELECT_EXISTING_FOODS_SQL);
             ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                // key: 음식 이름, value: food_id
                foodMap.put(rs.getString("name"), rs.getInt("food_id"));
            }
        }
        return foodMap;
    }

    /**
     * 주어진 날짜와 식사 타입의 meal_id가 있는지 확인합니다.
     */
    private int getMealIdIfExist(Connection con, String servedDate, String mealType) throws SQLException {
        try (PreparedStatement stmt = con.prepareStatement(SELECT_MEAL_ID_SQL)) {
            stmt.setString(1, servedDate);
            stmt.setString(2, mealType);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    return rs.getInt("meal_id");
                }
                return 0; // 존재하지 않으면 0 반환
            }
        }
    }


    // ----------------------------------------------------
    // 3. 메인 삽입 로직
    // ----------------------------------------------------

    public void importDataFromWeb() throws SQLException, IOException {
        Connection con = JDBCConnector.getConnection();

        // 1. 웹 크롤링 및 데이터 파싱
        List<MealData> crawledData = crawlAndParseMenu();

        if (crawledData.isEmpty()) {
            System.out.println("크롤링된 데이터가 없습니다.");
            if (con != null) con.close();
            return;
        }

        // 2. ID 및 Food 정규화 데이터 구조 초기화
        int maxMealId = getMaxId(con, "meals", "meal_id");
        int maxFoodId = getMaxId(con, "foods", "food_id");

        AtomicInteger mealIdCounter = new AtomicInteger(maxMealId + 1);
        AtomicInteger foodIdCounter = new AtomicInteger(maxFoodId + 1);

        // [핵심: 기존 foods 데이터를 모두 로드하여 중복 삽입 방지]
        Map<String, Integer> foodIdMap = getExistingFoods(con);

        System.out.printf("ID 카운터 초기화: meals(MAX_ID: %d), foods(MAX_ID: %d)\n", maxMealId, maxFoodId);

        // [수정: 최종 보고를 위한 카운터 추가]
        int newMealCount = 0;
        int skippedMealCount = 0;

        // 3. JDBC PreparedStatement 및 트랜잭션 설정
        try (PreparedStatement mealStmt = con.prepareStatement(INSERT_MEAL_SQL);
             PreparedStatement foodStmt = con.prepareStatement(INSERT_FOOD_SQL);
             PreparedStatement mealFoodsStmt = con.prepareStatement(INSERT_MEAL_FOODS_SQL)) {

            con.setAutoCommit(false);

            // 4. 파싱된 데이터 순회 및 DB 삽입 (기존 로직 재활용)
            int batchCount = 0;
            for (MealData data : crawledData) {

                String servedDate = data.servedDate;
                String mealType = data.mealType;
                String cleanContent = data.menuContent;

                if (cleanContent.isEmpty()) {
                    continue; // 메뉴 내용이 비어있으면 건너뛰기
                }

                // ----------------------------------------------------
                // [핵심: Meal 중복 체크 및 삽입 로직]
                // ----------------------------------------------------
                int currentMealId = getMealIdIfExist(con, servedDate, mealType);

                if (currentMealId == 0) {
                    // 4-1. 새로운 meals 테이블 삽입 (중복이 아닐 경우만 삽입)
                    currentMealId = mealIdCounter.getAndIncrement();

                    mealStmt.setInt(1, currentMealId);
                    mealStmt.setString(2, servedDate);
                    mealStmt.setString(3, mealType);
                    mealStmt.addBatch();

                    newMealCount++; // 새롭게 삽입된 Meal 카운트
                } else {
                    // 중복된 경우, 메시지를 출력하고 다음 MealData로 넘어갑니다.
                    skippedMealCount++; // 건너뛴 Meal 카운트
                    continue;
                }
                // ----------------------------------------------------


                // 4-2. foods 및 meal_foods 테이블 처리
                List<String> foodNames = Arrays.stream(cleanContent.split(","))
                        .map(String::trim)
                        .filter(name -> !name.isEmpty())
                        .distinct()
                        .collect(Collectors.toList());

                for (String foodName : foodNames) {

                    // ORA-12899 오류 방지 로직 (30자 초과 시 자르기)
                    String safeFoodName = foodName;
                    if (safeFoodName.length() > 30) {
                        safeFoodName = foodName.substring(0, 30);
                    }

                    int foodId;

                    // foods 중복 체크 (DB 데이터 포함)
                    if (foodIdMap.containsKey(safeFoodName)) {
                        foodId = foodIdMap.get(safeFoodName);
                    } else {
                        // 새로운 음식이면 ID 부여 및 foods 테이블에 삽입
                        foodId = foodIdCounter.getAndIncrement();
                        foodIdMap.put(safeFoodName, foodId);

                        foodStmt.setInt(1, foodId);
                        foodStmt.setString(2, safeFoodName);
                        foodStmt.addBatch();
                    }

                    // meal_foods 테이블 삽입 (currentMealId는 새로 생성된 ID입니다.)
                    mealFoodsStmt.setInt(1, currentMealId);
                    mealFoodsStmt.setInt(2, foodId);
                    mealFoodsStmt.addBatch();
                }

                batchCount++;
                // 주기적으로 배치 실행 및 커밋
                if (batchCount % 100 == 0) {
                    mealStmt.executeBatch();
                    foodStmt.executeBatch();
                    mealFoodsStmt.executeBatch();
                    con.commit();
                    System.out.println(batchCount + "건 데이터 처리 및 커밋 완료.");
                }
            } // end of crawledData loop

            // 남은 배치 최종 실행
            mealStmt.executeBatch();
            foodStmt.executeBatch();
            mealFoodsStmt.executeBatch();

            // 최종 커밋
            con.commit();

            int newFoodCount = foodIdCounter.get() - (maxFoodId + 1);

            if (newMealCount > 0) {
                System.out.println("데이터 삽입 완료.");
                System.out.printf("총 %d개의 식사 정보 (meals) 와 %d개의 고유 음식 정보 (foods) 가 새로 삽입되었습니다. (중복으로 건너뛴 meal: %d)\n",
                        newMealCount, newFoodCount, skippedMealCount);
            }
            else System.out.println("새로 가져올 데이터가 없습니다.");


        } catch (SQLException e) {
            System.err.println("데이터베이스 삽입 중 오류 발생. 롤백합니다.");
            if (con != null) {
                con.rollback();
            }
            throw e;
        } finally {
            if (con != null) {
                con.setAutoCommit(true);
                con.close(); // 연결을 닫습니다.
            }
        }
    }


    /**
     * 웹 페이지에서 학식 메뉴를 크롤링하고 파싱하여 MealData 리스트를 반환합니다.
     */
    private List<MealData> crawlAndParseMenu() throws IOException {
        List<MealData> menuList = new ArrayList<>();

        System.out.println("메뉴 크롤링 시작: " + CRAWLING_URL);

        // Jsoup을 사용하여 웹페이지 연결 및 문서 가져오기
        Document doc = Jsoup.connect(CRAWLING_URL).timeout(10000).get();

        String ROW_SELECTOR = "table.tbl_table.menu tbody tr";
        Elements rows = doc.select(ROW_SELECTOR);

        DateTimeFormatter outputFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        String[] mealTypes = {"조식", "중식", "석식"};

        Pattern dateExtractorPattern = Pattern.compile("(\\d{4}-\\d{2}-\\d{2})\\s+\\d{2}:\\d{2}:\\d{2}\\.\\d");


        for (Element row : rows) {
            String CELL_SELECTOR = "td";
            Elements cells = row.select(CELL_SELECTOR);

            if (cells.size() < 4) continue;

            // --------------------------------------------------------
            // 1. 날짜 파싱 (첫 번째 셀: index 0)
            // --------------------------------------------------------
            Element dateCell = cells.get(0);

            // **[수정된 로직]** 셀의 전체 HTML 내용을 가져옵니다.
            String dateCellHtml = dateCell.html();

            String extractedDateStr = null; // 'YYYY-MM-DD' 형태의 날짜를 담을 변수

            // 정규식을 사용하여 'YYYY-MM-DD 00:00:00.0' 형태의 전체 날짜 문자열을 찾습니다.
            Matcher extractorMatcher = dateExtractorPattern.matcher(dateCellHtml);

            if (extractorMatcher.find()) {
                // 정규식 그룹 1: 날짜 부분 ('YYYY-MM-DD')만 추출합니다.
                extractedDateStr = extractorMatcher.group(1);
            }

            // extractedDateStr은 이제 '2025-12-16' 형태입니다.
            String servedDate = extractedDateStr; // YYYY-MM-DD 형태로 이미 추출되었으므로 그대로 사용합니다.

            if (servedDate == null) continue; // 날짜 추출에 실패하면 해당 행 건너뜀

            // --------------------------------------------------------
            // 2. 조식, 중식, 석식 순서로 반복 처리 (인덱스 1, 2, 3)
            // --------------------------------------------------------
            for (int i = 0; i < 3; i++) {
                Element menuCell = cells.get(i + 1);

                String menuContentRaw = menuCell.select("span").text();

                String cleanContent = menuContentRaw
                        .replaceAll("\\s{2,}", " ")
                        .replaceAll("([가-힣]),([가-힣])", "$1 , $2")
                        .replaceAll(" ,", ",")
                        .replaceAll("\\s+", ",")
                        .replaceAll(",{2,}", ",")
                        .replaceAll("^,|, $", "")
                        .trim();

                if (!cleanContent.isEmpty() && cleanContent.length() > 2 && !cleanContent.matches("[-~]")) {
                    menuList.add(new MealData(servedDate, mealTypes[i], cleanContent));
                }
            }
        }

        System.out.printf("크롤링 완료. 총 %d개의 식사 메뉴 데이터를 수집했습니다.\n", menuList.size());
        return menuList;
    }

    // ======================== TEST ========================
    public static void main(String[] args) throws IOException {
        CrawlingMealsRepository cmr = new CrawlingMealsRepository();
        List<MealData> crawledData = cmr.crawlAndParseMenu();
        for (MealData md : crawledData) {
            System.out.println("served_date : " + md.servedDate);
            System.out.println("meal_type : " + md.mealType);
            System.out.println("menuContent : " + md.menuContent);
        }
    }
}