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

public class DayMealView extends JPanel {
    private JTable table;
    private DefaultTableModel model;
    private ArrayList<Meal> mealList;
    private String[] colNames = {"구분", "메뉴", "평점"};

    // todo Layout 예쁘게
    // ===================== 생성자 (라벨 설정) =====================
    public DayMealView() {
        LocalDate localDate = LocalDate.now();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy년 MM월 dd일");
        String formatted = localDate.format(formatter);

        DayOfWeek dow = localDate.getDayOfWeek();

        String dowKor = switch (dow) {
            case MONDAY -> "월요일";
            case TUESDAY -> "화요일";
            case WEDNESDAY -> "수요일";
            case THURSDAY -> "목요일";
            case FRIDAY -> "금요일";
            case SATURDAY -> "토요일";
            case SUNDAY -> "일요일";
        };

        JLabel lblTitle = new JLabel("오늘의 학식");
        JLabel lblDate = new JLabel(formatted + dowKor);

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
        table.setRowHeight(30);

        // 테이블 컬럼 너비 설정
        table.getColumnModel().getColumn(0).setPreferredWidth(20);
        table.getColumnModel().getColumn(1).setPreferredWidth(250);
        table.getColumnModel().getColumn(2).setPreferredWidth(40);

        DefaultTableCellRenderer centerRenderer = new DefaultTableCellRenderer();
        centerRenderer.setHorizontalAlignment(JLabel.CENTER); // 가운데 정렬

        for (int i = 0; i < table.getColumnCount(); i++) {
            table.getColumnModel().getColumn(i).setCellRenderer(centerRenderer);
        }

        add(table, BorderLayout.CENTER);
    }



    // ===================== 데이터 설정 =====================
    public void setTable() {
        // model에 행 개수 설정
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
