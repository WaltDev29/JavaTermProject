package presentation;

import domain.Meal;
import domain.Review;

import javax.swing.*;
import javax.swing.table.DefaultTableCellRenderer;
import javax.swing.table.DefaultTableModel;
import java.awt.*;
import java.time.DayOfWeek;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;

public class ReviewView extends JPanel{
    private JTable table;
    private DefaultTableModel model;
    private ArrayList<Review> reviewList;
    private String[] colNames = {"이름", "리뷰", "평점"};
    // todo 이 파일 구현 해야 함.

    // todo Layout 예쁘게
    // ===================== 생성자 (라벨 설정) =====================
    public ReviewView() {
        LocalDate today  = LocalDate.now();

        // 포맷 설정
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy년 MM월 dd일");
        // 포맷 적용
        String formattedToday = today.format(formatter);

        DayOfWeek dow = today.getDayOfWeek();

        String dowKor = switch (dow) {
            case MONDAY -> "월요일";
            case TUESDAY -> "화요일";
            case WEDNESDAY -> "수요일";
            case THURSDAY -> "목요일";
            case FRIDAY -> "금요일";
            case SATURDAY -> "토요일";
            case SUNDAY -> "일요일";
        };

        // 라벨 설정
        JLabel lblTitle = new JLabel("오늘의 리뷰");
        JLabel lblDate = new JLabel(formattedToday + " " + dowKor);

        add(lblTitle, BorderLayout.NORTH);
        add(lblDate);
    }



    // ===================== 테이블 초기화 =====================
    public void initView() {
        // 셀 수정 방지
        model = new DefaultTableModel(colNames, reviewList.size()) {
            @Override
            public boolean isCellEditable(int row, int column) {
                return false;
            }
        };

        table = new JTable(model);
        table.setRowHeight(20);

        // 테이블 컬럼 너비 설정
        table.getColumnModel().getColumn(0).setPreferredWidth(20);
        table.getColumnModel().getColumn(1).setPreferredWidth(200);
        table.getColumnModel().getColumn(2).setPreferredWidth(40);

        // 가운데 정렬
        DefaultTableCellRenderer centerRenderer = new DefaultTableCellRenderer();
        centerRenderer.setHorizontalAlignment(JLabel.CENTER);

        table.getColumnModel().getColumn(0).setCellRenderer(centerRenderer);
        table.getColumnModel().getColumn(2).setCellRenderer(centerRenderer);

        // 스크롤바 설정
        JScrollPane scrollPane = new JScrollPane(table);

        add(scrollPane, BorderLayout.CENTER);
    }



    // ===================== 데이터 설정 =====================
    public void setTable() {
        // model에 행 개수 설정
        model.setRowCount(reviewList.size());
        Review review;

        for (int i = 0; i < reviewList.size(); i++) {
            review = reviewList.get(i);
//            model.setValueAt(types[i], i, 0);
//            model.setValueAt(String.join(", ", review.getMenus()), i, 1);
            // todo 평점 넣는 로직 구현
            //model.setValueAt(review, i, 2);
        }
    }



    public void setMealList(ArrayList<Review> reviewList) {
        this.reviewList = reviewList;
    }
}
