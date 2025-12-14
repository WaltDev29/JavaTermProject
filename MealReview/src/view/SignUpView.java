package view;

import javax.swing.*;
import java.awt.*;

public class SignUpView extends JDialog{
    JTextField tfId;
    JTextField tfPw;
    JTextField tfPwCheck;

    JButton signInBtn;
    JButton signUpBtn;

    public SignUpView(JFrame parent) {
        // Dialog 설정
        super(parent, "회원가입",true);

        setDefaultCloseOperation(DISPOSE_ON_CLOSE);
        setSize(300, 400);
        setLocationRelativeTo(parent);
        setLayout(new BorderLayout());

        // Label 설정
        JLabel lblTitle = new JLabel("회원가입");
        lblTitle.setFont(new Font("맑은 고딕", Font.BOLD, 20));
        lblTitle.setHorizontalAlignment(JLabel.CENTER);
        lblTitle.setAlignmentX(Component.CENTER_ALIGNMENT);

        JPanel headerPanel = new JPanel();
        headerPanel.setLayout(new BoxLayout(headerPanel, BoxLayout.Y_AXIS));

        headerPanel.add(lblTitle);
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

        // 학번 입력 Label 설정
        JLabel lblId = new JLabel("학번");
        lblId.setFont(new Font("맑은 고딕", Font.BOLD, 15));
        lblId.setAlignmentX(Component.CENTER_ALIGNMENT);
        form.add(lblId);

        // 학번 입력 TextField 설정
        tfId = new JTextField(18);
        tfId.setMaximumSize(tfId.getPreferredSize());
        tfId.setAlignmentX(Component.CENTER_ALIGNMENT);
        form.add(tfId);

        // margin 추가
        form.add(Box.createVerticalStrut(20));

        // Password 입력 Label 설정
        JLabel lblPw = new JLabel("Password");
        lblPw.setFont(new Font("맑은 고딕", Font.BOLD, 15));
        lblPw.setAlignmentX(Component.CENTER_ALIGNMENT);
        form.add(lblPw);

        // Password 입력 TextField 설정
        tfPw = new JTextField(18);
        tfPw.setMaximumSize(tfPw.getPreferredSize());
        tfPw.setAlignmentX(Component.CENTER_ALIGNMENT);
        form.add(tfPw);

        // margin 추가
        form.add(Box.createVerticalStrut(20));

        // Password Check 입력 Label 설정
        JLabel lblPwCheck = new JLabel("Password Check");
        lblPwCheck.setFont(new Font("맑은 고딕", Font.BOLD, 15));
        lblPwCheck.setAlignmentX(Component.CENTER_ALIGNMENT);
        form.add(lblPwCheck);

        // Password Check 입력 TextField 설정
        tfPwCheck = new JTextField(18);
        tfPwCheck.setMaximumSize(tfPwCheck.getPreferredSize());
        tfPwCheck.setAlignmentX(Component.CENTER_ALIGNMENT);
        form.add(tfPwCheck);

        add(form, BorderLayout.CENTER);
    }



    // ===================== 버튼 Panel =====================
    private void setBtnPanel() {
        // Panel & Button 생성
        JPanel btnPan = new JPanel();
        btnPan.setLayout(new BoxLayout(btnPan, BoxLayout.Y_AXIS));

        signUpBtn = new JButton("회원가입");
        signUpBtn.setAlignmentX(Component.CENTER_ALIGNMENT);
        signInBtn = new JButton("로그인");
        signInBtn.setAlignmentX(Component.CENTER_ALIGNMENT);

        // 요소 배치
        btnPan.add(signUpBtn);
        btnPan.add(Box.createVerticalStrut(10));
        btnPan.add(signInBtn);
        btnPan.add(Box.createVerticalStrut(10));

        add(btnPan, BorderLayout.SOUTH);
    }


    public JTextField getTfId() {
        return tfId;
    }

    public JTextField getTfPw() {
        return tfPw;
    }

    public JTextField getTfPwCheck() {
        return tfPwCheck;
    }

    public JButton getSignInBtn() {
        return signInBtn;
    }

    public JButton getSignUpBtn() {
        return signUpBtn;
    }
}
