package presentation;

import domain.Meal;

import javax.swing.*;
import javax.swing.table.DefaultTableCellRenderer;
import javax.swing.table.DefaultTableModel;
import java.awt.*;
import java.time.DayOfWeek;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;

public class WeekMealView extends JPanel {
    private JTable table;
    private DefaultTableModel model;
    private ArrayList<Meal> mealList;
    private String[] colNames = {"날짜", "조식", "중식", "석식"};

    private LocalDate startDate;
    private LocalDate endDate;

    // todo Layout 예쁘게
    // ===================== 생성자 (라벨 설정) =====================
    public WeekMealView() {
        LocalDate today = LocalDate.now();

        startDate = today.with(DayOfWeek.MONDAY);
        endDate = today.with(DayOfWeek.FRIDAY);

        // 포맷 설정
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy년 MM월 dd일");
        // 포맷 적용
        String formattedStartDate = startDate.format(formatter);
        String formattedEndDate = endDate.format(formatter);

        // 라벨 설정
        JLabel lblTitle = new JLabel("이번주 학식");
        JLabel lblDate = new JLabel(formattedStartDate + "~" + formattedEndDate);

        add(lblTitle, BorderLayout.NORTH);
        add(lblDate);
    }



    // ===================== 테이블 초기화 =====================
    public void initView() {
        // 셀 수정 방지
        model = new DefaultTableModel(colNames, mealList.size()) {
            @Override
            public boolean isCellEditable(int row, int column) {
                return false;
            }
        };

        table = new JTable(model);
        table.setRowHeight(20);

        // 테이블 컬럼 너비 설정
        table.getColumnModel().getColumn(0).setPreferredWidth(20);
        table.getColumnModel().getColumn(1).setPreferredWidth(150);
        table.getColumnModel().getColumn(2).setPreferredWidth(150);
        table.getColumnModel().getColumn(3).setPreferredWidth(150);

        // 가운데 정렬
        DefaultTableCellRenderer centerRenderer = new DefaultTableCellRenderer();
        centerRenderer.setHorizontalAlignment(JLabel.CENTER);

        for (int i = 0; i < table.getColumnCount(); i++) {
            table.getColumnModel().getColumn(i).setCellRenderer(centerRenderer);
        }

        // 스크롤바 설정
        JScrollPane scrollPane = new JScrollPane(table);

        add(scrollPane, BorderLayout.CENTER);
    }



    // ===================== 데이터 설정 =====================
    public void setTable() {
        model.setRowCount(mealList.size());
        Meal meal;

        for (int i = 0; i < mealList.size(); i++) {
            meal = mealList.get(i);
            if (i % 3 == 0) model.setValueAt(meal.getMenus() + " " + meal.getDayOfWeek(), i, 0);
            model.setValueAt(String.join(", ", meal.getMenus()), i / 3, (i % 3) + 1);
        }
    }



    public void setMealList(ArrayList<Meal> mealList) {
        this.mealList = mealList;
    }
}
