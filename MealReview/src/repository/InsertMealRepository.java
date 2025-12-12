package repository;

import java.io.IOException;
import java.nio.charset.Charset;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.stream.Collectors;

public class InsertMealRepository {

    // ----------------------------------------------------
    // 1. SQL 쿼리 정의
    // ----------------------------------------------------
    private static final String INSERT_MEAL_SQL =
            "INSERT INTO meals (meal_id, served_date, meal_type) VALUES (?, ?, ?)";
    private static final String INSERT_FOOD_SQL =
            "INSERT INTO foods (food_id, name) VALUES (?, ?)";
    private static final String INSERT_MEAL_FOODS_SQL =
            "INSERT INTO meal_foods (meal_id, food_id) VALUES (?, ?)";

    private static final String CSV_FILE_PATH = "src/data/menus.CSV";

    // 요청하신 '949' 인코딩 (CP949 또는 Windows-949) 설정
    private static final Charset ENCODING = Charset.forName("CP949");

    /**
     * CSV 파일을 읽고 데이터베이스에 학식 데이터를 삽입합니다.
     * * @param con 준비된 JDBC Connection 객체
     * @throws SQLException 데이터베이스 오류 발생 시
     * @throws IOException 파일 읽기 오류 발생 시
     */
    public void importData(Connection con) throws SQLException, IOException {

        // ----------------------------------------------------
        // 2. ID 및 Food 정규화 데이터 구조 초기화
        // ----------------------------------------------------
        // ID는 1부터 시작하며, AtomicInteger로 스레드 안전하게 관리
        AtomicInteger mealIdCounter = new AtomicInteger(1);
        AtomicInteger foodIdCounter = new AtomicInteger(1);

        // Food 정규화를 위한 (음식 이름 -> food_id) 매핑 저장소
        Map<String, Integer> foodIdMap = new HashMap<>();

        // JDBC PreparedStatement 준비
        try (PreparedStatement mealStmt = con.prepareStatement(INSERT_MEAL_SQL);
             PreparedStatement foodStmt = con.prepareStatement(INSERT_FOOD_SQL);
             PreparedStatement mealFoodsStmt = con.prepareStatement(INSERT_MEAL_FOODS_SQL)) {

            // 트랜잭션 시작: 모든 INSERT 작업이 성공해야만 커밋되도록 설정
            con.setAutoCommit(false);

            // 파일 읽기 (CP949 인코딩 사용)
            List<String> lines = Files.readAllLines(Paths.get(CSV_FILE_PATH), ENCODING);

            if (lines.size() <= 1) {
                System.out.println("CSV 파일에 데이터가 없습니다.");
                return;
            }

            List<String> mealTypes = Arrays.asList("조식", "중식", "석식");

            // 데이터 행 처리 시작 (lines.get(0)은 헤더이므로 1부터 시작)
            for (int i = 1; i < lines.size(); i++) {
                String line = lines.get(i);

                // CSV 라인 분리 (쉼표를 기준으로 분리하며, 따옴표 안의 쉼표는 무시하는 정규식 사용)
                String[] parts = line.split(",(?=(?:[^\"]*\"[^\"]*\")*[^\"]*$)", -1);

                // 유효성 검사 (최소 '날짜', '요일', '조식', '중식', '석식' 컬럼)
                if (parts.length < 5) {
                    System.err.println("경고: 유효하지 않은 CSV 행을 건너뜁니다: " + line);
                    continue;
                }

                String servedDate = parts[0].trim();

                // 식사 타입 (조식, 중식, 석식) 반복 처리
                for (int j = 0; j < 3; j++) {
                    String mealType = mealTypes.get(j);
                    // CSV 컬럼 인덱스: parts[2]는 조식, parts[3]은 중식, parts[4]는 석식
                    String menuContentRaw = parts[2 + j].trim();

                    // 큰 따옴표 제거: "쌀밥 , 김치국 , ..." -> 쌀밥 , 김치국 , ...
                    String cleanContent = menuContentRaw.replaceAll("^\"|\"$", "").trim();

                    if (cleanContent.isEmpty()) {
                        continue; // 메뉴 내용이 비어있으면 건너뛰기
                    }

                    // ----------------------------------------------------
                    // 3-1. meals 테이블 삽입
                    // ----------------------------------------------------
                    int currentMealId = mealIdCounter.getAndIncrement();

                    mealStmt.setInt(1, currentMealId);
                    mealStmt.setString(2, servedDate);
                    mealStmt.setString(3, mealType);
                    mealStmt.addBatch();

                    // ----------------------------------------------------
                    // 3-2. foods 및 meal_foods 테이블 처리
                    // ----------------------------------------------------
                    // 메뉴를 쉼표로 분리 후 trim(), 비어있는 문자열 제거, 중복 음식 제거
                    List<String> foodNames = Arrays.stream(cleanContent.split(","))
                            .map(String::trim)
                            .filter(name -> !name.isEmpty())
                            .distinct()
                            .collect(Collectors.toList());

                    for (String foodName : foodNames) {
                        int foodId;

                        // foods 테이블 정규화: 이미 등록된 음식인지 확인
                        if (foodIdMap.containsKey(foodName)) {
                            foodId = foodIdMap.get(foodName);
                        } else {
                            // 새로운 음식이면 ID 부여 및 foods 테이블에 삽입
                            foodId = foodIdCounter.getAndIncrement();
                            foodIdMap.put(foodName, foodId);

                            foodStmt.setInt(1, foodId);
                            foodStmt.setString(2, foodName);
                            foodStmt.addBatch();
                        }

                        // meal_foods 테이블 삽입
                        mealFoodsStmt.setInt(1, currentMealId);
                        mealFoodsStmt.setInt(2, foodId);
                        mealFoodsStmt.addBatch();
                    }
                }

                // 주기적으로 배치 실행 및 커밋 (DB 부하를 줄이고 메모리 관리를 위함)
                if (i % 500 == 0) {
                    mealStmt.executeBatch();
                    foodStmt.executeBatch();
                    mealFoodsStmt.executeBatch();
                    con.commit();
                }
            }

            // 남은 배치 최종 실행
            mealStmt.executeBatch();
            foodStmt.executeBatch();
            mealFoodsStmt.executeBatch();

            // 최종 커밋
            con.commit();

            System.out.println("데이터 삽입 완료.");
            System.out.printf("총 %d개의 식사 정보 (meals) 와 %d개의 고유 음식 정보 (foods) 가 삽입되었습니다.\n",
                    mealIdCounter.get() - 1, foodIdCounter.get() - 1);

        } catch (SQLException e) {
            // 오류 발생 시 롤백 (데이터 일관성 유지)
            System.err.println("데이터베이스 삽입 중 오류 발생. 롤백합니다.");
            con.rollback();
            throw e;
        } finally {
            // 트랜잭션 모드 원복
            con.setAutoCommit(true);
        }
    }

    // Main 메소드 또는 데이터 처리 로직 예시


    public static void main(String[] args) {

        try (Connection con = JDBCConnector.getConnection()) {

            InsertMealRepository importer = new InsertMealRepository();

            // [2] 데이터 삽입 메소드 호출
            importer.importData(con);

        } catch (SQLException e) {
            System.err.println("DB 연결 또는 SQL 실행 오류: " + e.getMessage());
            e.printStackTrace();
        } catch (IOException e) {
            System.err.println("파일 읽기 오류: " + e.getMessage());
            e.printStackTrace();
        }
    }
}