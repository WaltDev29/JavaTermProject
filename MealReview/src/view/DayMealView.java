package view;

import domain.Meal;

import javax.swing.*;
import javax.swing.table.DefaultTableCellRenderer;
import javax.swing.table.DefaultTableModel;
import javax.swing.table.TableColumn;
import java.awt.*;
import java.time.LocalTime;
import java.util.ArrayList;

public class DayMealView extends JPanel {
    private JTable table;
    private DefaultTableModel model;
    private ArrayList<Meal> mealList;
    private String[] colNames = {"구분", "메뉴", "평점"};

    private ArrayList<JButton> reviewBtns;

    private String[] ratingStar = {"☆", "★","★☆","★★","★★☆","★★★","★★★☆","★★★★","★★★★☆","★★★★★"};

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

        table.setRowSelectionAllowed(false);
        table.setColumnSelectionAllowed(false);
        table.setCellSelectionEnabled(false);
        table.setFocusable(false);
        table.getTableHeader().setReorderingAllowed(false);


        // row 높이 설정
        table.setRowHeight(85);

        // 테이블 컬럼 너비 설정
        table.getColumnModel().getColumn(0).setPreferredWidth(10);
        table.getColumnModel().getColumn(1).setPreferredWidth(320);
        table.getColumnModel().getColumn(2).setPreferredWidth(40);

        model.setRowCount(3);

        // 텍스트 가운데 정렬
        DefaultTableCellRenderer centerRenderer = new DefaultTableCellRenderer();
        centerRenderer.setHorizontalAlignment(JLabel.CENTER);

        for (int i = 0; i < table.getColumnCount(); i++) {
            table.getColumnModel().getColumn(i).setCellRenderer(centerRenderer);
        }

        // 평점 컬럼 Font Size 조정
        TableColumn column = table.getColumnModel().getColumn(2);
        column.setCellRenderer(new DefaultTableCellRenderer() {
            @Override
            public Component getTableCellRendererComponent(
                    JTable table, Object value, boolean isSelected,
                    boolean hasFocus, int row, int column) {

                Component c = super.getTableCellRendererComponent(
                        table, value, isSelected, hasFocus, row, column);

                c.setFont(c.getFont().deriveFont(Font.BOLD, 18f)); // 폰트 크기
                setHorizontalAlignment(SwingConstants.CENTER);     // 가운데 정렬

                return c;
            }
        });

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
            JButton btn = new JButton("리뷰 작성");
            reviewBtns.add(btn);
            buttonPan.add(btn);
        }



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
        if ("-".equals(table.getValueAt(0, 1))) return;
        reviewBtns.get(0).setVisible(true);

        if (now.isBefore(lunchTime)) return;
        if ("-".equals(table.getValueAt(1, 1))) return;
        reviewBtns.get(1).setVisible(true);

        if (now.isBefore(dinnerTime)) return;
        if ("-".equals(table.getValueAt(2, 1))) return;
        reviewBtns.get(2).setVisible(true);
    }



    // ===================== 데이터 설정 =====================
    public void setTable() {
        if (mealList == null) return;

        // 기본값 설정
        String[] types = {"조식", "중식", "석식"};
        for (int i = 0; i < 3; i++) {
            model.setValueAt(types[i], i, 0);
            model.setValueAt("-", i, 1);
            model.setValueAt("-", i, 2);
        }

        for (Meal meal : mealList) {
            int row = switch (meal.getType()) {
                case "조식" -> 0;
                case "중식" -> 1;
                case "석식" -> 2;
                default -> -1;
            };

            if (row == -1) continue;
            String rating = "";
            if (meal.getRating() > 0) rating = ratingStar[meal.getRating() - 1];

            model.setValueAt(String.join(", ", meal.getMenus()), row, 1);
            model.setValueAt(rating, row, 2);
        }

        // 버튼 visible 설정
        updateButtonVisibility();
    }



    // ===================== Getter & Setter =====================
    public void setMealList(ArrayList<Meal> mealList) {
        this.mealList = mealList;
    }

    public ArrayList<JButton> getReviewBtns() {
        return reviewBtns;
    }
}
