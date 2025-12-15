package controller;

import domain.Meal;
import domain.Review;
import repository.AccountRepository;
import view.*;
import repository.MealRepository;
import repository.ReviewRepository;

import javax.swing.*;
import java.awt.event.ActionListener;
import java.awt.event.WindowAdapter;
import java.awt.event.WindowEvent;

import java.sql.Date;
import java.time.DayOfWeek;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;

/* todo
    1. 학식 데이터 자동으로 가져오는 로직 구현
    */

public class MainController extends JFrame {
    // View Pans
    SignInView loginDialog;
    SignUpView signUpDialog;
    ReviewDialog reviewDialog;
    DayMealView dayMealPan;
    WeekMealView weekMealPan;
    ReviewView reviewPan;

    // Repositories
    AccountRepository accountRepo;
    MealRepository mealRepo;
    ReviewRepository reviewRepo;

    // Lists
    ArrayList<Meal> dayMealList;
    ArrayList<Meal> weekMealList;
    ArrayList<Review> reviewList;

    // LogIn Elements
    JTextField tfLoginId;
    JTextField tfLoginPw;
    JButton signInBtn;
    JButton signUpBtn;

    // SignUp Elements
    JTextField tfSignUpId;
    JTextField tfSignUpPw;
    JTextField tfSignUpPwCheck;
    JButton backToSignInBtn;
    JButton submitAccountBtn;

    // Inner Elements
    JTabbedPane tab = new JTabbedPane(JTabbedPane.TOP);
    ArrayList<JButton> reviewBtns;  // 리뷰 작성 버튼
    JButton reviewSubmitBtn;    // 리뷰 등록 버튼
    JButton reviewDeleteBtn;


    // 날짜 변수
//    LocalDate today = LocalDate.now();    // 오늘
    // 방학기간은 학식이 없으니, 아래의 문장을 실행하여 테스트합니다.
    LocalDate today = LocalDate.of(2025, 12, 8);
    LocalDate monday = today.with(DayOfWeek.MONDAY);    // 이번주 월요일
    LocalDate friday = today.with(DayOfWeek.FRIDAY);    // 이번주 금요일

    // ID 변수
    String student_id = "";
    boolean[] isReviewed = {false, false, false};


    // ===================== 생성자 =====================
    public MainController() {
        accountRepo = new AccountRepository();
        initLoginDialog();
    }


    // ===================== Frame 초기화 =====================
    // Login Dialog 초기화
    private void initLoginDialog() {
        loginDialog = new SignInView(this);

        // 창 닫으면 프로그램 종료
        loginDialog.addWindowListener(new WindowAdapter() {
            @Override
            public void windowClosing(WindowEvent e) {
                System.exit(0);
            }
        });

        tfLoginId = loginDialog.getTfId();
        tfLoginPw = loginDialog.getTfPw();
        signInBtn = loginDialog.getSignInBtn();
        signUpBtn = loginDialog.getSignUpBtn();

        signInBtn.addActionListener(e -> handleSignIn());
        signUpBtn.addActionListener(e ->
        {
            loginDialog.dispose();
            initSignUpDialog();
        });

        loginDialog.setVisible(true);
    }

    // SignUp Dialog 초기화
    private void initSignUpDialog() {
        signUpDialog = new SignUpView(this);

        signUpDialog.addWindowListener(new WindowAdapter() {
            @Override
            public void windowClosing(WindowEvent e) {
                System.exit(0);
            }
        });

        tfSignUpId = signUpDialog.getTfId();
        tfSignUpPw = signUpDialog.getTfPw();
        tfSignUpPwCheck = signUpDialog.getTfPwCheck();
        backToSignInBtn = signUpDialog.getSignInBtn();
        submitAccountBtn = signUpDialog.getSignUpBtn();

        backToSignInBtn.addActionListener(e -> {
            signUpDialog.dispose();
            initLoginDialog();
        });
        submitAccountBtn.addActionListener(e -> submitAccount());

        signUpDialog.setVisible(true);
    }

    // Main Frame 초기화
    private void initFrame() {
        // Repositories 초기화
        mealRepo = new MealRepository();
        reviewRepo = new ReviewRepository();

        isReviewed = reviewRepo.getIsReviewed(student_id, Date.valueOf(today));
        System.out.printf("%s %s %s", isReviewed[0], isReviewed[1], isReviewed[2]);

        // ===================== 금일 메뉴 Panel =====================
        dayMealList = mealRepo.getMealsbyDate(Date.valueOf(today));
        dayMealPan = new DayMealView(formatDate(today), convertKorDow(today));
        dayMealPan.setMealList(dayMealList);
        dayMealPan.initView();
        dayMealPan.setTable();

        // 리뷰 버튼 클릭 이벤트 설정
        reviewBtns = dayMealPan.getReviewBtns();

        initReviewBtn();

        tab.add("금일 메뉴", dayMealPan);


        // ===================== 금주 메뉴 Panel =====================
        weekMealPan = new WeekMealView(formatDate(monday), formatDate(friday));
        weekMealList = mealRepo.getMealsbyDates(Date.valueOf(monday), Date.valueOf(friday));
        weekMealPan.setMealList(weekMealList);
        weekMealPan.initView();
        weekMealPan.setTable(today);

        tab.add("금주 메뉴", weekMealPan);


        // ===================== 리뷰 메뉴 Panel =====================
        reviewPan = new ReviewView(formatDate(today), convertKorDow(today));
        reviewList = reviewRepo.getReviews(Date.valueOf(today), "", "");
        reviewPan.setReviewList(reviewList);
        reviewPan.initView();

        tab.add("리뷰", reviewPan);


        // ===================== JFrame Layout 설정 =====================
        setTitle("오늘의 학식");
        setDefaultCloseOperation(EXIT_ON_CLOSE);
        setResizable(false);

        CenterFrame cf = new CenterFrame(800, 400);
        cf.centerPoint();
        setBounds(cf.getX(), cf.getY(), cf.getFw(), cf.getFh());

        add(tab);

        setVisible(true);
    }


    // ===================== 테이블 초기화 메서드 =====================
    private void initDatas() {
        // 금일 메뉴 data
        dayMealList = mealRepo.getMealsbyDate(Date.valueOf(today));
        dayMealPan.setMealList(dayMealList);
        dayMealPan.setTable();

        // 리뷰 data
        reviewList = reviewRepo.getReviews(Date.valueOf(today), "", "");
        reviewPan.setReviewList(reviewList);
        reviewPan.updateTableByTab();

        // 리뷰 여부 data
        isReviewed = reviewRepo.getIsReviewed(student_id, Date.valueOf(today));
    }


    // ===================== 리뷰 버튼 초기화 메서드 =====================
    private void initReviewBtn() {
        String[] types = {"조식", "중식", "석식"};

        for (int i = 0; i < isReviewed.length; i++) {
            // 람다식을 위한 변수
            int meal_id = dayMealList.get(i).getMealId();
            String type = types[i];

            // 기존 리스너 제거
            for (ActionListener al : reviewBtns.get(i).getActionListeners()) {
                reviewBtns.get(i).removeActionListener(al);
            }
            
            // text 설정 및 리스너 추가
            if (isReviewed[i]) {
                reviewBtns.get(i).addActionListener(e -> openUpdateReviewDialog(type));
                reviewBtns.get(i).setText("리뷰 수정");
            }
            else {
                reviewBtns.get(i).addActionListener(e -> openReviewDialog(meal_id, type));
                reviewBtns.get(i).setText("리뷰 작성");
            }
        }
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


    // ===================== 버튼 클릭 메서드 =====================
    // 로그인 버튼 클릭 메서드
    private void handleSignIn() {
        if (accountRepo.checkAccount(tfLoginId.getText().strip(), tfLoginPw.getText().strip())) {
            JOptionPane.showMessageDialog(loginDialog, "로그인되었습니다.", "로그인 성공", JOptionPane.PLAIN_MESSAGE);
            student_id = tfLoginId.getText().strip();
            loginDialog.dispose();
            initFrame();
        } else {
            JOptionPane.showMessageDialog(loginDialog, "계정정보가 일치하지 않습니다.", "로그인 실패", JOptionPane.WARNING_MESSAGE);
        }
    }

    // 회원가입 버튼 클릭 메서드
    private void submitAccount() {
        if (tfSignUpId.getText().strip().isEmpty() || tfSignUpPw.getText().strip().isEmpty() || tfSignUpPwCheck.getText().strip().isEmpty()) {
            JOptionPane.showMessageDialog(signUpDialog, "모든 정보를 입력해주세요", "회원가입 오류", JOptionPane.WARNING_MESSAGE);
            return;
        }

        if (!tfSignUpPw.getText().strip().equals(tfSignUpPwCheck.getText().strip())) {
            JOptionPane.showMessageDialog(signUpDialog, "비밀번호가 일치하지 않습니다.", "회원가입 오류", JOptionPane.WARNING_MESSAGE);
            return;
        }

        String result = accountRepo.insertAccount(tfSignUpId.getText().strip(), tfSignUpPw.getText().strip());

        if (result.isEmpty()) {
            JOptionPane.showMessageDialog(signUpDialog, "회원가입이 정상적으로 완료되었습니다.", "회원가입 완료", JOptionPane.PLAIN_MESSAGE);
            signUpDialog.dispose();
            initLoginDialog();
        } else JOptionPane.showMessageDialog(signUpDialog, result, "회원가입 오류", JOptionPane.WARNING_MESSAGE);
    }

    // 리뷰하기 버튼 클릭 메서드
    private void openReviewDialog(int meal_id, String mealType) {
        reviewDialog = new ReviewDialog(this, formatDate(today), convertKorDow(today), mealType, false);
        reviewSubmitBtn = reviewDialog.getSubmitBtn();
        reviewSubmitBtn.addActionListener(e -> submitReview(meal_id, reviewDialog.getComment(), reviewDialog.getRating()));
        reviewDialog.setVisible(true);
    }

    // 리뷰 수정 Dialog
    private void openUpdateReviewDialog(String mealType) {
        ArrayList<Review> reviews = reviewRepo.getReviews(Date.valueOf(today), student_id, mealType);

        reviewDialog = new ReviewDialog(this, formatDate(today), convertKorDow(today), mealType, true);
        reviewSubmitBtn = reviewDialog.getSubmitBtn();
        reviewDeleteBtn = reviewDialog.getDeleteBtn();

        reviewDialog.setCommentArea(reviews.get(0).getComment());
        reviewDialog.setRatingBox(reviews.get(0).getRating()-1);

        reviewSubmitBtn.setText("수정");
        reviewSubmitBtn.addActionListener(e -> updateReview(reviews.get(0).getReview_id(), reviewDialog.getComment(), reviewDialog.getRating()));
        reviewDeleteBtn.addActionListener(e -> deleteReview(reviews.get(0).getReview_id()));
        reviewDialog.setVisible(true);
    }

    // 리뷰 등록 버튼 클릭 메서드
    private void submitReview(int meal_id, String comment, int rating) {
        boolean isDone = reviewRepo.insertReview(reviewRepo.getLastId()+1, meal_id, student_id, comment, rating);

        if (isDone) {
            JOptionPane.showMessageDialog(this, "리뷰 등록이 완료되었습니다.");
            initDatas();
            initReviewBtn();
        } else
            JOptionPane.showMessageDialog(this, "리뷰 등록에 실패했습니다.\n관리자에게 문의해주세요.", "리뷰 등록 실패", JOptionPane.WARNING_MESSAGE);

        reviewDialog.dispose();
    }

    // 리뷰 수정 확인 버튼 클릭 메서드
    private void updateReview(int review_id, String comment, int rating) {
        if (JOptionPane.showConfirmDialog(this, "리뷰를 수정하시겠습니까?", "리뷰 수정 확인", JOptionPane.YES_NO_OPTION) == JOptionPane.NO_OPTION) return;

        boolean isDone = reviewRepo.updateReview(review_id, comment, rating);

        if (isDone) {
            JOptionPane.showMessageDialog(this, "리뷰 수정이 완료되었습니다.");
            initDatas();
        } else
            JOptionPane.showMessageDialog(this, "리뷰 수정에 실패했습니다.\n관리자에게 문의해주세요.", "리뷰 수정 실패", JOptionPane.WARNING_MESSAGE);

        reviewDialog.dispose();
    }
    
    // 리뷰 삭제 버튼 클릭 메서드
    private void deleteReview(int review_id) {
        if (JOptionPane.showConfirmDialog(this, "리뷰를 삭제하시겠습니까?", "리뷰 삭제 확인", JOptionPane.YES_NO_OPTION) == JOptionPane.NO_OPTION) return;

        boolean isDone = reviewRepo.deleteReview(review_id);

        if (isDone) {
            JOptionPane.showMessageDialog(this, "리뷰 등록이 완료되었습니다.");
            initDatas();
            initReviewBtn();
        } else
            JOptionPane.showMessageDialog(this, "리뷰 등록에 실패했습니다.\n관리자에게 문의해주세요.", "리뷰 등록 실패", JOptionPane.WARNING_MESSAGE);

        reviewDialog.dispose();
    }


    // ===================== main =====================
    public static void main(String[] args) {
        new MainController();
    }
}
