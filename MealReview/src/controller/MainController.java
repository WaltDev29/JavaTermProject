package controller;

// 일단 사용자 모드 먼저 구현하고 그 다음에 생각합시다.

import domain.Meal;
import domain.Review;
import view.*;
import repository.MealRepository;
import repository.ReviewRepository;

import javax.swing.*;
import java.sql.Date;
import java.time.DayOfWeek;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;

/* todo
    1. 로그인 기능 구현
    2. 리뷰 작성 글자 수 제한 
    3. 리뷰 평점 별 기호로 표시하기
    4. DayMealVIew에 평점 표시하기. (각 평점 평균내서)
    5. 이미 리뷰했는지 확인 후 리뷰 수정 버튼으로 수정 (dialog안에 삭제버튼도 추가)
    6. Frame resizable false 설정
    7. table resizable false, selectable false 설정
    8. 학식 갖고 올 때 비어있는 걸 어떻게 처리할 건지.
    (테이블에 날짜, 구분을 지정해놓고 거기에 맞춰 넣게 할 건지, 아니면 갖고 올 때 빈 학식 객체를 만들 건지)
    */

public class MainController extends JFrame {
    // View Pans
    DayMealView dayMealPan;
    WeekMealView weekMealPan;
    ReviewView reviewPan;

    // Repositories
    MealRepository mealRepo;
    ReviewRepository reviewRepo;

    // Lists
    ArrayList<Meal> dayMealList;
    ArrayList<Meal> weekMealList;
    ArrayList<Review> reviewList;

    // Inner Elements
    JTabbedPane tab = new JTabbedPane(JTabbedPane.TOP);
    ArrayList<JButton> reviewBtns;  // 리뷰 작성 버튼
    JButton reviewSubmitBtn;    // 리뷰 등록 버튼

    // 날짜 변수
//    LocalDate today = LocalDate.now();    // 오늘
    // 방학기간은 학식이 없으니, 아래의 문장을 실행하여 테스트합니다.
    LocalDate today = LocalDate.now().with(DayOfWeek.MONDAY);
    LocalDate monday = today.with(DayOfWeek.MONDAY);    // 이번주 월요일
    LocalDate friday = today.with(DayOfWeek.FRIDAY);    // 이번주 금요일

    // ID 변수
    String student_id = "2501110203";   // todo 로그인 로직 구현 후 여기에 id 대입하기
    int lastReview_id;  // 리뷰 추가용 id


    
    public MainController() {
        // Repositories 초기화
        mealRepo = new MealRepository();
        reviewRepo = new ReviewRepository();

        // ===================== 금일 메뉴 Panel =====================
        dayMealList = mealRepo.getMealsbyDate(Date.valueOf(today));
        dayMealPan = new DayMealView(formatDate(today), convertKorDow(today));
        dayMealPan.setMealList(dayMealList);
        dayMealPan.initView();
        dayMealPan.setTable();

        // 리뷰 버튼 클릭 이벤트 설정
        reviewBtns = dayMealPan.getReviewBtns();
        reviewBtns.get(0).addActionListener(e -> openReviewDialog(dayMealList.get(0).getMealId(), "조식"));
        reviewBtns.get(1).addActionListener(e -> openReviewDialog(dayMealList.get(1).getMealId(), "중식"));
        reviewBtns.get(2).addActionListener(e -> openReviewDialog(dayMealList.get(2).getMealId(), "석식"));

        tab.add("금일 메뉴", dayMealPan);



        // ===================== 금주 메뉴 Panel =====================
        weekMealPan = new WeekMealView(convertKorDow(monday), convertKorDow(friday));
        weekMealList = mealRepo.getMealsbyDates(Date.valueOf(monday), Date.valueOf(friday));
        weekMealPan.setMealList(weekMealList);
        weekMealPan.initView();
        weekMealPan.setTable();

        tab.add("금주 메뉴", weekMealPan);



        // ===================== 리뷰 메뉴 Panel =====================
        reviewPan = new ReviewView(formatDate(today), convertKorDow(today));
        reviewList = reviewRepo.getReviews(Date.valueOf(today));
        lastReview_id = reviewList.get(reviewList.size() - 1).getReview_id();
        reviewPan.setReviewList(reviewList);
        reviewPan.initView();

        tab.add("리뷰", reviewPan);



        // ===================== JFrame Layout 설정 =====================
        setTitle("오늘의 학식");
        setDefaultCloseOperation(EXIT_ON_CLOSE);

        CenterFrame cf = new CenterFrame(800, 400);
        cf.centerPoint();
        setBounds(cf.getX(), cf.getY(), cf.getFw(), cf.getFh());

        add(tab);

        setVisible(true);
    }



    // ===================== Date 변환 메서드 =====================
    // date to String
    private String formatDate(LocalDate date) {
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy년 MM월 dd일");
        return date.format(formatter);
    }
    
    // date to Kor
    private String convertKorDow(LocalDate date) {
        DayOfWeek dow = date.getDayOfWeek();
        return switch (dow) {
            case MONDAY -> "월요일";
            case TUESDAY -> "화요일";
            case WEDNESDAY -> "수요일";
            case THURSDAY -> "목요일";
            case FRIDAY -> "금요일";
            case SATURDAY -> "토요일";
            case SUNDAY -> "일요일";
        };
    }



    // ===================== 리뷰 버튼 클릭 메서드 =====================
    // 리뷰 Dialog 열기 메서드
    private void openReviewDialog(int meal_id, String mealType) {
        ReviewDialog dialog = new ReviewDialog(this, formatDate(today), convertKorDow(today), mealType);
        reviewSubmitBtn = dialog.getSubmitBtn();
        reviewSubmitBtn.addActionListener(e -> submitReview(meal_id, dialog.getComment(), dialog.getRating()));
        dialog.setVisible(true);
    }
    
    // 리뷰 등록 버튼 클릭 메서드
    private void submitReview(int meal_id, String comment, int rating) {
        boolean isDone = reviewRepo.insertReview(lastReview_id+1, meal_id, student_id, comment, rating);

        if (isDone) JOptionPane.showMessageDialog(this, "리뷰 등록이 완료되었습니다.");
        else JOptionPane.showMessageDialog(this,"리뷰 등록에 실패했습니다.\n관리자에게 문의해주세요.", "리뷰 등록 실패", JOptionPane.WARNING_MESSAGE);
        dispose();
    }


    // ===================== main =====================
    public static void main(String[] args) {
        new MainController();
    }
}
