package view;

import domain.Review;

import javax.swing.*;
import javax.swing.table.DefaultTableCellRenderer;
import javax.swing.table.DefaultTableModel;
import java.awt.*;
import java.time.DayOfWeek;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
// todo 타입별 탭 구현
public class ReviewView extends JPanel{
    private JTable table;
    private DefaultTableModel model;
    private ArrayList<Review> reviewList;
    private ArrayList<Review> reviewList_breakfast;
    private ArrayList<Review> reviewList_lunch;
    private ArrayList<Review> reviewList_dinner;
    private String[] colNames = {"이름", "리뷰", "평점"};

    // todo Layout 예쁘게
    // ===================== 생성자 (라벨 설정) =====================
    public ReviewView(LocalDate today) {
        setLayout(new BorderLayout());

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
        lblTitle.setFont(new Font("맑은 고딕", Font.BOLD, 20)); // 보기 좋게 폰트 추가
        lblTitle.setHorizontalAlignment(JLabel.CENTER);

        JLabel lblDate = new JLabel(formattedToday + " " + dowKor);
        lblDate.setHorizontalAlignment(JLabel.CENTER);

        JPanel headerPan = new JPanel();
        headerPan.setLayout(new BoxLayout(headerPan, BoxLayout.Y_AXIS));

        lblTitle.setAlignmentX(Component.CENTER_ALIGNMENT);
        lblDate.setAlignmentX(Component.CENTER_ALIGNMENT);

        headerPan.add(lblTitle);
        headerPan.add(lblDate);
        headerPan.add(Box.createVerticalStrut(10)); // 간격 추가

        JPanel tablePan = new JPanel();
        add(tablePan, BorderLayout.CENTER);
        JTabbedPane tab = new JTabbedPane(JTabbedPane.TOP);
        add(tab);

        add(headerPan, BorderLayout.NORTH);
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

        for (int i=0; i<colNames.length; i++) {
            table.getColumnModel().getColumn(i).setCellRenderer(centerRenderer);
        }

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
            model.setValueAt(review.getStudent_name(), i, 0);
            model.setValueAt(review.getComment(), i, 1);
            model.setValueAt(review.getRating(), i, 2);
        }
    }



    public void setReviewList(ArrayList<Review> reviewList) {
        this.reviewList = reviewList;

        this.reviewList_breakfast.clear();
        this.reviewList_lunch.clear();
        this.reviewList_dinner.clear();

        for (Review r : reviewList) {
            if (r.getType() == "조식") reviewList_breakfast.add(r);
            else if (r.getType() == "중식") reviewList_lunch.add(r);
            else reviewList_dinner.add(r);
        }
    }
}
