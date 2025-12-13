package view;

import javax.swing.*;
import java.awt.*;

public class ReviewDialog extends JDialog {
    private JTextArea commentArea;
    private JComboBox<Integer> ratingBox;

    private int meal_id;
    /* todo
        1. 아이디 받아서 db에 등록하는 로직 구현
     */

    public ReviewDialog(JFrame parent, int meal_id, String date, String dow, String mealType) {
        super(parent, "리뷰 작성 - " + mealType, true);
        this.meal_id = meal_id;

        setSize(400, 500);
        setLocationRelativeTo(parent);
        setLayout(new BorderLayout());


        JLabel lblTitle = new JLabel("리뷰 작성");
        lblTitle.setFont(new Font("맑은 고딕", Font.BOLD, 20)); // 보기 좋게 폰트 추가
        lblTitle.setHorizontalAlignment(JLabel.CENTER);

        JLabel lblDate = new JLabel(date + " " + dow);
        lblDate.setHorizontalAlignment(JLabel.CENTER);

        JLabel lblType = new JLabel(mealType);

        JPanel headerPanel = new JPanel();
        headerPanel.setLayout(new BoxLayout(headerPanel, BoxLayout.Y_AXIS));

        // 중앙 정렬을 위해 컴포넌트의 X축 정렬 변경
        lblTitle.setAlignmentX(Component.CENTER_ALIGNMENT);
        lblDate.setAlignmentX(Component.CENTER_ALIGNMENT);

        headerPanel.add(lblTitle);
        headerPanel.add(lblDate);
        headerPanel.add(lblType);
        headerPanel.add(Box.createVerticalStrut(10)); // 간격 추가

        add(headerPanel, BorderLayout.NORTH);

        
        setInputPanel();
        setBtnPanel();
    }



    // ===================== 입력 Panel =====================
    private void setInputPanel() {
        JPanel form = new JPanel();
        form.setLayout(new BoxLayout(form, BoxLayout.Y_AXIS));
        form.setBorder(BorderFactory.createEmptyBorder(10,10,10,10));

        JLabel lblReview = new JLabel("리뷰작성");
        lblReview.setAlignmentX(Component.LEFT_ALIGNMENT);
        form.add(lblReview);

        commentArea = new JTextArea(30, 18);
        JScrollPane scroll = new JScrollPane(commentArea);
        scroll.setAlignmentX(Component.LEFT_ALIGNMENT);
        form.add(scroll);

        JLabel lblRating = new JLabel("평점");
        lblRating.setAlignmentX(Component.LEFT_ALIGNMENT);

        form.add(lblRating);

        ratingBox = new JComboBox<>(new Integer[]{1,2,3,4,5,6,7,8,9,10});
        ratingBox.setAlignmentX(Component.LEFT_ALIGNMENT);
        form.add(ratingBox);

        add(form, BorderLayout.CENTER);
    }

    // ===================== 버튼 Panel =====================
    private void setBtnPanel() {
        JPanel btnPan = new JPanel();
        JButton submitBtn = new JButton("등록");
        JButton cancelBtn = new JButton("취소");

        btnPan.add(submitBtn);
        btnPan.add(cancelBtn);

        add(btnPan, BorderLayout.SOUTH);

        // 클릭 이벤트
        cancelBtn.addActionListener(e -> {
            int result = JOptionPane.showConfirmDialog(this, "리뷰 작성을 취소하시겠습니까?", "리뷰 작성 취소", JOptionPane.YES_NO_OPTION);
            if (result == JOptionPane.YES_OPTION) dispose();
        });

        submitBtn.addActionListener(e -> {
            // 나중에 DB 저장
            dispose();
        });
    }
}
