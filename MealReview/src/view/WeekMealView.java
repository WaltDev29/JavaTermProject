package view;

import domain.Meal;

import javax.swing.*;
import javax.swing.table.DefaultTableCellRenderer;
import javax.swing.table.DefaultTableModel;
import java.awt.*;
import java.time.LocalDate;
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
    public void setTable(LocalDate today) {
        if (mealList == null) return;

        model.setRowCount(5);

        // 날짜 컬럼 설정
        String[] dows = {"월요일", "화요일", "수요일", "목요일", "금요일"};
        
        for (int row = 0; row < 5; row++) {
            LocalDate date = today.plusDays(row);
            model.setValueAt(date + " " + dows[row], row, 0);

            // 빈 값 기본 설정
            model.setValueAt("-", row, 1);
            model.setValueAt("-", row, 2);
            model.setValueAt("-", row, 3);
        }

        // 메뉴 데이터 설정
        for (Meal meal : mealList) {
            LocalDate mealDate = meal.getDate().toLocalDate();

            int row = (int) java.time.temporal.ChronoUnit.DAYS
                    .between(today, mealDate);

            if (row < 0 || row >= 5) continue;

            int col = switch (meal.getType()) {
                case "조식" -> 1;
                case "중식" -> 2;
                case "석식" -> 3;
                default -> -1;
            };

            if (col == -1) continue;

            model.setValueAt(String.join(", ", meal.getMenus()), row, col);
        }
    }



    // ===================== Setter =====================
    public void setMealList(ArrayList<Meal> mealList) {
        this.mealList = mealList;
    }
}
