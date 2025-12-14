package view;

import domain.Meal;

import javax.swing.*;
import javax.swing.table.DefaultTableCellRenderer;
import javax.swing.table.DefaultTableModel;
import java.awt.*;
import java.util.ArrayList;

public class WeekMealView extends JPanel {
    private JTable table;
    private DefaultTableModel model;
    private ArrayList<Meal> mealList;
    private String[] colNames = {"날짜", "조식", "중식", "석식"};

    // ===================== 생성자 (라벨 설정) =====================
    public WeekMealView(String startDate, String endDate) {
        setLayout(new BorderLayout());
        // Title Label 설정
        JLabel lblTitle = new JLabel("이번주 학식");
        lblTitle.setFont(new Font("맑은 고딕", Font.BOLD, 20));
        lblTitle.setHorizontalAlignment(JLabel.CENTER);

        // 날짜 Label 설정
        JLabel lblDate = new JLabel(startDate + " ~ " + endDate);
        lblDate.setHorizontalAlignment(JLabel.CENTER);

        // Label 담을 Panel 설정
        JPanel headerPanel = new JPanel();
        headerPanel.setLayout(new BoxLayout(headerPanel, BoxLayout.Y_AXIS));

        // 가운데 정렬
        lblTitle.setAlignmentX(Component.CENTER_ALIGNMENT);
        lblDate.setAlignmentX(Component.CENTER_ALIGNMENT);

        // 요소 배치
        headerPanel.add(lblTitle);
        headerPanel.add(lblDate);
        headerPanel.add(Box.createVerticalStrut(10));

        add(headerPanel, BorderLayout.NORTH);
    }


    // ===================== 테이블 초기화 =====================
    public void initView() {
        // 셀 수정 방지
        model = new DefaultTableModel(colNames, 0) {
            @Override
            public boolean isCellEditable(int row, int column) {
                return false;
            }
        };
        
        table = new JTable(model);
        // 테이블 클릭 방지
        table.setRowSelectionAllowed(false);
        table.setColumnSelectionAllowed(false);
        table.setCellSelectionEnabled(false);
        table.setFocusable(false);
        table.getTableHeader().setReorderingAllowed(false);

        // 테이블 행 높이 설정
        table.setRowHeight(51);

        // 테이블 컬럼 너비 설정
        table.getColumnModel().getColumn(0).setPreferredWidth(200);
        table.getColumnModel().getColumn(1).setPreferredWidth(400);
        table.getColumnModel().getColumn(2).setPreferredWidth(400);
        table.getColumnModel().getColumn(3).setPreferredWidth(400);

        // 가운데 정렬
        DefaultTableCellRenderer centerRenderer = new DefaultTableCellRenderer();
        centerRenderer.setHorizontalAlignment(JLabel.CENTER);

        table.getColumnModel().getColumn(0).setCellRenderer(centerRenderer);

        // 자동 줄바꿈 설정
        for (int i = 1; i < table.getColumnCount(); i++) {
            table.getColumnModel().getColumn(i).setCellRenderer(new WordWrapCellRenderer(0));
        }

        // 스크롤바 설정
        JScrollPane scrollPane = new JScrollPane(table);

        add(scrollPane, BorderLayout.CENTER);
    }


    // ===================== 데이터 설정 =====================
    public void setTable() {
        if (mealList == null) return;

        model.setRowCount(mealList.size() / 3);

        for (int i = 0; i < mealList.size(); i++) {
            Meal meal = mealList.get(i);
            if (i % 3 == 0) model.setValueAt(meal.getDate() + " " + meal.getDayOfWeek(), i / 3, 0);
            model.setValueAt(String.join(", ", meal.getMenus()), i / 3, (i % 3) + 1);
        }

//        resizeRowHeights();
    }


    // ===================== Setter =====================
    public void setMealList(ArrayList<Meal> mealList) {
        this.mealList = mealList;
    }
}
