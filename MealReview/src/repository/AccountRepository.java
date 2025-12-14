package repository;

import org.mindrot.jbcrypt.BCrypt;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class AccountRepository {
    // ===================== SELECT 메서드 =====================
    // CheckAccount
    public boolean checkAccount(String id, String pw) {
        Connection con = JDBCConnector.getConnection();
        PreparedStatement ps;
        ResultSet rs;
        boolean isDone = false;

        String sql = "SELECT password_hash FROM accounts WHERE student_id = ?";
        try {
            ps = con.prepareStatement(sql);
            ps.setString(1, id);
            rs = ps.executeQuery();

            if (rs.next()) {
                String dbHash = rs.getString("password_hash");
                isDone =  BCrypt.checkpw(pw, dbHash);
            }
        }
        catch (SQLException e) {
            System.out.println("====== ERROR ======\n" + e.getMessage());
            throw new RuntimeException(e);
        }

        try {
            if (rs != null) rs.close();
            if (ps != null) ps.close();
            if (con != null) con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return isDone;
    }

    // 데이터 존재 여부 Check
    private boolean checkExist(Connection con, String table, String id) {
        PreparedStatement ps;
        ResultSet rs;
        boolean isExist = false;

        String sql = "SELECT student_id FROM " + table + " WHERE student_id = ?";
        try {
            ps = con.prepareStatement(sql);
            ps.setString(1, id);
            rs = ps.executeQuery();

            if (rs.next()) {
                isExist = true;
            }
        }
        catch (SQLException e) {
            System.out.println("====== ERROR ======\n" + e.getMessage());
            throw new RuntimeException(e);
        }

        try {
            if (rs != null) rs.close();
            if (ps != null) ps.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return isExist;
    }



    // ===================== INSERT 메서드 =====================
    public String insertAccount(String id, String pw) {
        Connection con = JDBCConnector.getConnection();
        PreparedStatement ps = null;
        String sql;

        if (!checkExist(con, "students", id)) {
            try {
                con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
            return "학생정보가 존재하지 않습니다.\n관리자에게 문의해주세요.";
        }

        else if (checkExist(con, "accounts", id)) {
            try {
                con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
            return "이미 존재하는 계정입니다.";
        }

        else {
            sql = "INSERT INTO accounts (student_id, password_hash) VALUES (?, ?)";
            String hashedPw = BCrypt.hashpw(pw, BCrypt.gensalt(10));
            try {
                ps = con.prepareStatement(sql);
                ps.setString(1, id);
                ps.setString(2, hashedPw);
                ps.executeUpdate();
            }
            catch (SQLException e) {
                System.out.println("====== ERROR ======\n" + e.getMessage());
                return "계정 등록에 실패하였습니다.\n관리자에게 문의해주세요.";
            }
        }

        try {
            if (ps != null) ps.close();
            if (con != null) con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return "";
    }
}
