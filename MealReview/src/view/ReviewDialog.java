package view;

import java.awt.Toolkit;
import javax.swing.text.*;
import javax.swing.*;
import java.awt.*;

public class ReviewDialog extends JDialog {
    private JTextArea commentArea;
    private JComboBox<String> ratingBox;
    private JButton submitBtn;
    private JButton deleteBtn;

    private boolean updateMode;

    private String[] ratingStar = {"☆", "★","★☆","★★","★★☆","★★★","★★★☆","★★★★","★★★★☆","★★★★★"};

    // ===================== 생성자 =====================
    public ReviewDialog(JFrame parent, String date, String dow, String mealType, boolean updateMode) {
        // Dialog 설정
        super(parent, "리뷰 " + (updateMode ? "수정" : "작성") + " - " + mealType, true);

        setSize(400, 500);
        setLocationRelativeTo(parent);
        setResizable(false);
        setLayout(new BorderLayout());

        this.updateMode = updateMode;

        // Label 설정
        JLabel lblTitle = new JLabel("리뷰 " + (updateMode ? "수정" : "작성"));
        lblTitle.setFont(new Font("맑은 고딕", Font.BOLD, 20));
        lblTitle.setHorizontalAlignment(JLabel.CENTER);

        JLabel lblDate = new JLabel(date + " " + dow);
        lblDate.setHorizontalAlignment(JLabel.CENTER);

        JLabel lblType = new JLabel(mealType);

        JPanel headerPanel = new JPanel();
        headerPanel.setLayout(new BoxLayout(headerPanel, BoxLayout.Y_AXIS));

        lblTitle.setAlignmentX(Component.CENTER_ALIGNMENT);
        lblDate.setAlignmentX(Component.CENTER_ALIGNMENT);
        lblType.setAlignmentX(Component.CENTER_ALIGNMENT);

        headerPanel.add(lblTitle);
        headerPanel.add(lblDate);
        headerPanel.add(lblType);
        
        headerPanel.add(Box.createVerticalStrut(10));

        add(headerPanel, BorderLayout.NORTH);



        // Input Panel 설정
        setInputPanel();
        
        // Button Panel 설정
        setBtnPanel();
    }



    // ===================== 입력 Panel =====================
    private void setInputPanel() {
        // Panel 생성 및 Layout 설정
        JPanel form = new JPanel();
        form.setLayout(new BoxLayout(form, BoxLayout.Y_AXIS));
        form.setBorder(BorderFactory.createEmptyBorder(10,10,10,10));
        
        // 리뷰 작성 Label 설정
        JLabel lblReview = new JLabel("리뷰작성");
        lblReview.setAlignmentX(Component.LEFT_ALIGNMENT);
        form.add(lblReview);

        // 리뷰 작성 TextArea 설정
        commentArea = new JTextArea(30, 18);
        commentArea.setLineWrap(true);  // 자동 줄바꿈
        commentArea.setWrapStyleWord(true); // 단어 단위 줄바꿈
        JScrollPane scroll = new JScrollPane(commentArea);
        scroll.setAlignmentX(Component.LEFT_ALIGNMENT);
        form.add(scroll);

        // 글자수 제한 설정
        ((AbstractDocument) commentArea.getDocument()).setDocumentFilter(new DocumentFilter() {
            private int max = 450;

            @Override
            public void insertString(FilterBypass fb, int offset, String string, AttributeSet attr) throws BadLocationException {
                if ((fb.getDocument().getLength() + string.length()) <= max) {
                    super.insertString(fb, offset, string, attr);
                } else {
                    Toolkit.getDefaultToolkit().beep();
                }
            }

            @Override
            public void replace(FilterBypass fb, int offset, int length, String text, AttributeSet attrs) throws BadLocationException {
                if ((fb.getDocument().getLength() - length + text.length()) <= max) {
                    super.replace(fb, offset, length, text, attrs);
                } else {
                    Toolkit.getDefaultToolkit().beep();
                }
            }
        });


        // 평점 Label 설정
        JLabel lblRating = new JLabel("평점");
        lblRating.setAlignmentX(Component.LEFT_ALIGNMENT);
        form.add(lblRating);

        // 평점 ComboBox 설정
        ratingBox = new JComboBox<>(ratingStar);
        ratingBox.setAlignmentX(Component.LEFT_ALIGNMENT);
        form.add(ratingBox);

        add(form, BorderLayout.CENTER);
    }

    // ===================== 버튼 Panel =====================
    private void setBtnPanel() {
        String lblText = "등록";
        if (updateMode) lblText = "수정";

        // Panel & Button 생성
        JPanel btnPan = new JPanel();
        submitBtn = new JButton(lblText);
        JButton cancelBtn = new JButton("취소");

        // 요소 배치
        btnPan.add(submitBtn);
        if (updateMode) {
            deleteBtn = new JButton("삭제");
            btnPan.add(deleteBtn);
        }
        btnPan.add(cancelBtn);

        add(btnPan, BorderLayout.SOUTH);

        // 클릭 이벤트
        cancelBtn.addActionListener(e -> {
            int result = JOptionPane.showConfirmDialog(this, "리뷰 작성을 취소하시겠습니까?", "리뷰 작성 취소", JOptionPane.YES_NO_OPTION);
            if (result == JOptionPane.YES_OPTION) dispose();
        });
    }

    public JButton getSubmitBtn() {
        return submitBtn;
    }

    public JButton getDeleteBtn() {
        return deleteBtn;
    }

    public String getComment() {
        return commentArea.getText();
    }

    public int getRating() {
        return ratingBox.getSelectedIndex()+1;
    }

    public void setRatingBox(int idx) {
        this.ratingBox.setSelectedIndex(idx);
    }

    public void setCommentArea(String comment) {
        this.commentArea.setText(comment);
    }



    // ===================== Test =====================
    public static void main(String[] args) {
        ReviewDialog reviewDialog = new ReviewDialog(null, "date", "dow", "type", true);

        reviewDialog.setCommentArea("asd");
        reviewDialog.setRatingBox(9);
        reviewDialog.setVisible(true);
    }
}
