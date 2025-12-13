package view;

import domain.Review;

import javax.swing.*;
import javax.swing.table.DefaultTableCellRenderer;
import javax.swing.table.DefaultTableModel;
import java.awt.*;
import java.util.ArrayList;

public class ReviewView extends JPanel{
    private JTable table;
    private DefaultTableModel model;
    private JTabbedPane tab;
    private String[] colNames = {"이름", "리뷰", "평점"};

    private ArrayList<Review> reviewList;
    private ArrayList<Review> reviewList_breakfast;
    private ArrayList<Review> reviewList_lunch;
    private ArrayList<Review> reviewList_dinner;

    // ===================== 생성자 (라벨 설정) =====================
    public ReviewView(String date, String dow) {
        // 레이아웃 설정
        setLayout(new BorderLayout());

        // Title Label 설정
        JLabel lblTitle = new JLabel("오늘의 리뷰");
        lblTitle.setFont(new Font("맑은 고딕", Font.BOLD, 20));
        lblTitle.setHorizontalAlignment(JLabel.CENTER);

        // 날짜 Label 설정
        JLabel lblDate = new JLabel(date + " " + dow);
        lblDate.setHorizontalAlignment(JLabel.CENTER);

        // Label 담을 Panel 설정
        JPanel headerPan = new JPanel();
        headerPan.setLayout(new BoxLayout(headerPan, BoxLayout.Y_AXIS));

        // 가운데 정렬
        lblTitle.setAlignmentX(Component.CENTER_ALIGNMENT);
        lblDate.setAlignmentX(Component.CENTER_ALIGNMENT);

        // 요소 배치
        headerPan.add(lblTitle);
        headerPan.add(lblDate);
        headerPan.add(Box.createVerticalStrut(10)); // 간격 추가

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

        table.getColumnModel().getColumn(0).setCellRenderer(centerRenderer);
        table.getColumnModel().getColumn(2).setCellRenderer(centerRenderer);

        // 줄바꿈 설정
        table.getColumnModel().getColumn(1).setCellRenderer(new WordWrapCellRenderer());

        // 스크롤바 설정
        JScrollPane scrollPane = new JScrollPane(table);



        // ===================== Tab 초기화 =====================
        tab = new JTabbedPane(JTabbedPane.TOP);

        tab.addTab("조식", new JPanel());
        tab.addTab("중식", new JPanel());
        tab.addTab("석식", new JPanel());

        // tab의 Panel 크기 줄이기
        tab.setUI(new javax.swing.plaf.basic.BasicTabbedPaneUI() {
            @Override
            protected int calculateTabAreaHeight(int tabPlacement, int runCount, int maxTabHeight) {
                return maxTabHeight;
            }
        });

        // tab 클릭 이벤트 설정
        tab.addChangeListener(e -> updateTableByTab());


        
        // 요소 배치
        add(tab, BorderLayout.NORTH);
        add(scrollPane, BorderLayout.CENTER);

        setTable(reviewList_breakfast); // 기본으로 보여줄 데이터 설정
    }


    
    // ===================== Tab 클릭 메서드 =====================
    private void updateTableByTab() {
        int idx = tab.getSelectedIndex();

        if (idx == 0) setTable(reviewList_breakfast);
        else if (idx == 1) setTable(reviewList_lunch);
        else setTable(reviewList_dinner);
    }
    
    

    // ===================== 데이터 설정 =====================
    // List 설정
    public void setReviewList(ArrayList<Review> reviewList) {
        this.reviewList = reviewList;

        this.reviewList_breakfast = new ArrayList<>();
        this.reviewList_lunch = new ArrayList<>();
        this.reviewList_dinner = new ArrayList<>();

        for (Review r : reviewList) {
            if (r.getType().equals("조식")) reviewList_breakfast.add(r);
            else if (r.getType().equals("중식")) reviewList_lunch.add(r);
            else reviewList_dinner.add(r);
        }
    }

    // 테이블 설정
    private void setTable(ArrayList<Review> list) {
        model.setRowCount(list.size());

        for (int i = 0; i < list.size(); i++) {
            Review r = list.get(i);
            model.setValueAt(r.getStudent_name(), i, 0);
            model.setValueAt(r.getComment(), i, 1);
            model.setValueAt(r.getRating(), i, 2);
        }
    }
}
