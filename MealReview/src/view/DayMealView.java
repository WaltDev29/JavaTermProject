package view;

import domain.Meal;

import javax.swing.*;
import javax.swing.table.DefaultTableCellRenderer;
import javax.swing.table.DefaultTableModel;
import java.awt.*;
import java.time.LocalTime;
import java.util.ArrayList;

public class DayMealView extends JPanel {
    private JTable table;
    private DefaultTableModel model;
    private ArrayList<Meal> mealList;
    private String[] colNames = {"구분", "메뉴", "평점"};

    private ArrayList<JButton> reviewBtns;

    // ===================== 생성자 (라벨 설정) =====================
    public DayMealView(String date, String dow) {
        setLayout(new BorderLayout());

        // title Label
        JLabel lblTitle = new JLabel("오늘의 학식");
        lblTitle.setFont(new Font("맑은 고딕", Font.BOLD, 20)); // 폰트, size 설정
        lblTitle.setHorizontalAlignment(JLabel.CENTER); // 가운데 정렬

        // 날짜 Label
        JLabel lblDate = new JLabel(date + " " + dow);
        lblDate.setHorizontalAlignment(JLabel.CENTER); // 가운데 정렬

        // Label 넣을 Panel 생성
        JPanel headerPanel = new JPanel();
        headerPanel.setLayout(new BoxLayout(headerPanel, BoxLayout.Y_AXIS));

        // 중앙 정렬을 위해 컴포넌트의 X축 정렬 변경
        lblTitle.setAlignmentX(Component.CENTER_ALIGNMENT);
        lblDate.setAlignmentX(Component.CENTER_ALIGNMENT);

        // 요소 배치
        headerPanel.add(lblTitle);
        headerPanel.add(lblDate);
        headerPanel.add(Box.createVerticalStrut(10)); // 간격 추가

        add(headerPanel, BorderLayout.NORTH);
    }



    // ===================== 테이블 초기화 =====================
    public void initView() {
        // table 넣을 Panel 생성
        JPanel centerPan = new JPanel(new BorderLayout());

        // 셀 수정 방지
        model = new DefaultTableModel(colNames, 0) {
            @Override
            public boolean isCellEditable(int row, int column) {
                return false;
            }
        };

        // table 초기화
        table = new JTable(model);
        
        // row 높이 설정
        table.setRowHeight(85);

        // 테이블 컬럼 너비 설정
        table.getColumnModel().getColumn(0).setPreferredWidth(15);
        table.getColumnModel().getColumn(1).setPreferredWidth(250);
        table.getColumnModel().getColumn(2).setPreferredWidth(40);

        // 텍스트 가운데 정렬
        DefaultTableCellRenderer centerRenderer = new DefaultTableCellRenderer();
        centerRenderer.setHorizontalAlignment(JLabel.CENTER);

        for (int i = 0; i < table.getColumnCount(); i++) {
            table.getColumnModel().getColumn(i).setCellRenderer(centerRenderer);
        }

        // ScrollPane 설정
        JScrollPane scrollPane = new JScrollPane(table);



        // ===================== 리뷰 버튼 초기화 =====================
        // 버튼 담음 Panel 생성
        JPanel buttonPan = new JPanel();
        buttonPan.setBorder(BorderFactory.createEmptyBorder(30, 10, 20, 10));   // margin 설정
        buttonPan.setLayout(new GridLayout(3, 1, 30, 30));  // 버튼 배치 설정

        // 버튼 생성
        reviewBtns = new ArrayList<>();
        for (int i=0; i<3; i++) {
            JButton btn = new JButton("리뷰하기");
            reviewBtns.add(btn);
            buttonPan.add(btn);
        }

        // 버튼 visible 설정
        updateButtonVisibility();



        // 요소 배치
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
        for (int i=0; i<3; i++) {
            reviewBtns.get(i).setVisible(false);
        }

        // 버튼 visible
        if (now.isBefore(breakfastTime)) return;
        reviewBtns.get(0).setVisible(true);

        if (now.isBefore(lunchTime)) return;
        reviewBtns.get(1).setVisible(true);

        if (now.isBefore(dinnerTime)) return;
        reviewBtns.get(2).setVisible(true);
    }



    // ===================== 데이터 설정 =====================
    public void setTable() {
        // model에 행 개수 설정
        if (mealList == null) return;

        model.setRowCount(mealList.size());

        String[] types = {"조식", "중식", "석식"};

        for (int i = 0; i < mealList.size(); i++) {
            Meal meal = mealList.get(i);
            model.setValueAt(types[i], i, 0);
            model.setValueAt(String.join(", ", meal.getMenus()), i, 1);
            // todo 평점 넣는 로직 구현
            //model.setValueAt(meal, i, 2);
        }
    }


    // ===================== Getter & Setter =====================
    public void setMealList(ArrayList<Meal> mealList) {
        this.mealList = mealList;
    }

    public ArrayList<JButton> getReviewBtns() {
        return reviewBtns;
    }
}
