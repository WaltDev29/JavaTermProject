package controller;

import domain.Meal;
import domain.Review;
import repository.AccountRepository;
import view.*;
import repository.MealRepository;
import repository.ReviewRepository;

import javax.swing.*;
import java.awt.event.WindowAdapter;
import java.awt.event.WindowEvent;

import java.sql.Date;
import java.time.DayOfWeek;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;

/* todo
    2. 리뷰 작성 글자 수 제한
    3. 리뷰 평점 별 기호로 표시하기 (이것부터!)
    5. 이미 리뷰했는지 확인 후 리뷰 수정 버튼으로 수정 (dialog안에 삭제버튼도 추가)
    6. Frame resizable false 설정
    7. table resizable false, selectable false 설정
    8. 학식 갖고 올 때 비어있는 걸 어떻게 처리할 건지.
    (테이블에 날짜, 구분을 지정해놓고 거기에 맞춰 넣게 할 건지, 아니면 갖고 올 때 빈 학식 객체를 만들 건지)
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


    // 날짜 변수
//    LocalDate today = LocalDate.now();    // 오늘
    // 방학기간은 학식이 없으니, 아래의 문장을 실행하여 테스트합니다.
    LocalDate today = LocalDate.now().with(DayOfWeek.MONDAY);
    LocalDate monday = today.with(DayOfWeek.MONDAY);    // 이번주 월요일
    LocalDate friday = today.with(DayOfWeek.FRIDAY);    // 이번주 금요일

    // ID 변수
    String student_id = "";
    int lastReview_id;  // 리뷰 추가용 id


    public MainController() {
        accountRepo = new AccountRepository();
        initLoginDialog();
    }



    // ===================== Login Dialog 초기화 =====================
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



    // ===================== SignUp Dialog 초기화 =====================
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



    // ===================== Main Frame 초기화 =====================
    private void initFrame() {
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
        }
        else JOptionPane.showMessageDialog(signUpDialog, result, "회원가입 오류", JOptionPane.WARNING_MESSAGE);
    }


    // ===================== 리뷰 버튼 클릭 메서드 =====================
    // 리뷰 Dialog 열기 메서드
    private void openReviewDialog(int meal_id, String mealType) {
        reviewDialog = new ReviewDialog(this, formatDate(today), convertKorDow(today), mealType);
        reviewSubmitBtn = reviewDialog.getSubmitBtn();
        reviewSubmitBtn.addActionListener(e -> submitReview(meal_id, reviewDialog.getComment(), reviewDialog.getRating()));
        reviewDialog.setVisible(true);
    }

    // 리뷰 등록 버튼 클릭 메서드
    private void submitReview(int meal_id, String comment, int rating) {
        boolean isDone = reviewRepo.insertReview(lastReview_id + 1, meal_id, student_id, comment, rating);

        if (isDone) JOptionPane.showMessageDialog(this, "리뷰 등록이 완료되었습니다.");
        else JOptionPane.showMessageDialog(this, "리뷰 등록에 실패했습니다.\n관리자에게 문의해주세요.", "리뷰 등록 실패", JOptionPane.WARNING_MESSAGE);

        reviewDialog.dispose();
    }


    // ===================== main =====================
    public static void main(String[] args) {
        new MainController();
    }
}
