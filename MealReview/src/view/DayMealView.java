package view;

import domain.Meal;

import javax.swing.*;
import javax.swing.table.DefaultTableCellRenderer;
import javax.swing.table.DefaultTableModel;
import java.awt.*;
import java.time.DayOfWeek;
import java.time.LocalDate;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;

public class DayMealView extends JPanel {
    private JTable table;
    private DefaultTableModel model;
    private ArrayList<Meal> mealList;
    private String[] colNames = {"구분", "메뉴", "평점"};

    private ArrayList<JButton> reviewBtns;
    private JButton breakfastBtn;
    private JButton lunchBtn;
    private JButton dinnerBtn;

    private JFrame parentFrame;
    private String date;
    private String dow;

    // todo 리뷰 취소 버튼 구현 (with ask dialog)
    // ===================== 생성자 (라벨 설정) =====================
    public DayMealView(JFrame parentFrame) {
        this.parentFrame = parentFrame;

        setLayout(new BorderLayout());

        LocalDate localDate = LocalDate.now();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy년 MM월 dd일");
        this.date = localDate.format(formatter);

        DayOfWeek dowEng = localDate.getDayOfWeek();

        this.dow = switch (dowEng) {
            case MONDAY -> "월요일";
            case TUESDAY -> "화요일";
            case WEDNESDAY -> "수요일";
            case THURSDAY -> "목요일";
            case FRIDAY -> "금요일";
            case SATURDAY -> "토요일";
            case SUNDAY -> "일요일";
        };

        JLabel lblTitle = new JLabel("오늘의 학식");
        lblTitle.setFont(new Font("맑은 고딕", Font.BOLD, 20)); // 보기 좋게 폰트 추가
        lblTitle.setHorizontalAlignment(JLabel.CENTER);

        JLabel lblDate = new JLabel(date + " " + dow);
        lblDate.setHorizontalAlignment(JLabel.CENTER);

        JPanel headerPanel = new JPanel();
        headerPanel.setLayout(new BoxLayout(headerPanel, BoxLayout.Y_AXIS));

        // 중앙 정렬을 위해 컴포넌트의 X축 정렬 변경
        lblTitle.setAlignmentX(Component.CENTER_ALIGNMENT);
        lblDate.setAlignmentX(Component.CENTER_ALIGNMENT);

        headerPanel.add(lblTitle);
        headerPanel.add(lblDate);
        headerPanel.add(Box.createVerticalStrut(10)); // 간격 추가

        add(headerPanel, BorderLayout.NORTH);
    }



    // ===================== 테이블 초기화 =====================
    public void initView() {
        JPanel centerPan = new JPanel(new BorderLayout());

        // 셀 수정 방지
        model = new DefaultTableModel(colNames, 0) {
            @Override
            public boolean isCellEditable(int row, int column) {
                return false;
            }
        };

        table = new JTable(model);
        table.setRowHeight(85);

        // 테이블 컬럼 너비 설정
        table.getColumnModel().getColumn(0).setPreferredWidth(15);
        table.getColumnModel().getColumn(1).setPreferredWidth(250);
        table.getColumnModel().getColumn(2).setPreferredWidth(40);

        DefaultTableCellRenderer centerRenderer = new DefaultTableCellRenderer();
        centerRenderer.setHorizontalAlignment(JLabel.CENTER); // 가운데 정렬

        for (int i = 0; i < table.getColumnCount(); i++) {
            table.getColumnModel().getColumn(i).setCellRenderer(centerRenderer);
        }

        JScrollPane scrollPane = new JScrollPane(table);

        JPanel buttonPan = new JPanel();
        buttonPan.setBorder(BorderFactory.createEmptyBorder(30, 10, 20, 10));
        buttonPan.setLayout(new GridLayout(3, 1, 30, 30));

        breakfastBtn = new JButton("리뷰하기");
        lunchBtn = new JButton("리뷰하기");
        dinnerBtn = new JButton("리뷰하기");

        breakfastBtn.addActionListener(e -> openReviewDialog(mealList.get(0).getMealId(), "조식"));
        lunchBtn.addActionListener(e -> openReviewDialog(mealList.get(1).getMealId(), "중식"));
        dinnerBtn.addActionListener(e -> openReviewDialog(mealList.get(2).getMealId(), "석식"));

//        todo 여기 버튼 리스트화 하는 것부터 재개. (controller에 버튼 리스너 추가해야됨.)

        buttonPan.add(breakfastBtn);
        buttonPan.add(lunchBtn);
        buttonPan.add(dinnerBtn);

        updateButtonVisibility();

        centerPan.add(scrollPane, BorderLayout.CENTER);
        centerPan.add(buttonPan, BorderLayout.EAST);

        add(centerPan, BorderLayout.CENTER);
    }



    // ===================== 버튼 visible 설정 =====================
    private void updateButtonVisibility() {
        LocalTime now = LocalTime.now();

        LocalTime breakfastTime = LocalTime.of(7, 30);
        LocalTime lunchTime = LocalTime.of(11, 30);
        LocalTime dinnerTime = LocalTime.of(17, 30);

        // 버튼 invisible
        breakfastBtn.setVisible(false);
        lunchBtn.setVisible(false);
        dinnerBtn.setVisible(false);

        // 버튼 visible
        if (now.isBefore(breakfastTime)) return;
        breakfastBtn.setVisible(true);

        if (now.isBefore(lunchTime)) return;
        lunchBtn.setVisible(true);

        if (now.isBefore(dinnerTime)) return;
        dinnerBtn.setVisible(true);
    }


    // ===================== 버튼 클릭 메서드 =====================
    private void openReviewDialog(int meal_id, String mealType) {
        ReviewDialog dialog = new ReviewDialog(parentFrame, meal_id, date, dow,mealType);
        dialog.setVisible(true);
    }



    // ===================== 데이터 설정 =====================
    public void setTable() {
        // model에 행 개수 설정
        if (mealList == null) {
            model.setRowCount(0);
            return;
        }
        model.setRowCount(mealList.size());

        Meal meal;

        String[] types = {"조식", "중식", "석식"};

        for (int i = 0; i < mealList.size(); i++) {
            meal = mealList.get(i);
            model.setValueAt(types[i], i, 0);
            model.setValueAt(String.join(", ", meal.getMenus()), i, 1);
            // todo 평점 넣는 로직 구현
            //model.setValueAt(meal, i, 2);
        }
    }



    public void setMealList(ArrayList<Meal> mealList) {
        this.mealList = mealList;
    }
}
