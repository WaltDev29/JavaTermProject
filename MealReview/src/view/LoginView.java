package view;

import javax.swing.*;
import java.awt.*;

public class LoginView extends JDialog {
    JTextField tfId;
    JTextField tfPw;

    public LoginView(JFrame parent) {
        super(parent, "로그인",true);

        setSize(400, 500);
        setLocationRelativeTo(parent);
        setLayout(new BorderLayout());
    }
}
