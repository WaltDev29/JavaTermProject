package view;

import javax.swing.*;
import java.awt.*;

public class SignInView extends JDialog {
    JTextField tfId;
    JPasswordField tfPw;

    JButton signInBtn;
    JButton signUpBtn;

    public SignInView(JFrame parent) {
        // Dialog 설정
        super(parent, "로그인",true);

        setDefaultCloseOperation(DISPOSE_ON_CLOSE);
        setSize(300, 280);
        setLocationRelativeTo(parent);
        setResizable(false);
        setLayout(new BorderLayout());

        // Label 설정
        JLabel lblTitle = new JLabel("로그인");
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

        // ID 입력 Label 설정
        JLabel lblId = new JLabel("ID");
        lblId.setFont(new Font("맑은 고딕", Font.BOLD, 15));
        lblId.setAlignmentX(Component.CENTER_ALIGNMENT);
        form.add(lblId);

        // ID 입력 TextField 설정
        tfId = new JTextField(18);
        tfId.setMaximumSize(tfId.getPreferredSize());
        tfId.setAlignmentX(Component.CENTER_ALIGNMENT);
        form.add(tfId);

        form.add(Box.createVerticalStrut(20));

        // Password 입력 Label 설정
        JLabel lblPw = new JLabel("Password");
        lblPw.setFont(new Font("맑은 고딕", Font.BOLD, 15));
        lblPw.setAlignmentX(Component.CENTER_ALIGNMENT);
        form.add(lblPw);

        // Password 입력 TextField 설정
        tfPw = new JPasswordField(18);
        tfPw.setMaximumSize(tfPw.getPreferredSize());
        tfPw.setAlignmentX(Component.CENTER_ALIGNMENT);
        form.add(tfPw);

        add(form, BorderLayout.CENTER);
    }



    // ===================== 버튼 Panel =====================
    private void setBtnPanel() {
        // Panel & Button 생성
        JPanel btnPan = new JPanel();
        btnPan.setLayout(new BoxLayout(btnPan, BoxLayout.Y_AXIS));

        signInBtn = new JButton("로그인");
        signInBtn.setAlignmentX(Component.CENTER_ALIGNMENT);
        signUpBtn = new JButton("회원가입");
        signUpBtn.setAlignmentX(Component.CENTER_ALIGNMENT);

        // 요소 배치
        btnPan.add(signInBtn);
        btnPan.add(Box.createVerticalStrut(10));
        btnPan.add(signUpBtn);
        btnPan.add(Box.createVerticalStrut(10));

        add(btnPan, BorderLayout.SOUTH);
    }


    public JTextField getTfId() {
        return tfId;
    }

    public JPasswordField getTfPw() {
        return tfPw;
    }

    public JButton getSignInBtn() {
        return signInBtn;
    }

    public JButton getSignUpBtn() {
        return signUpBtn;
    }
}
