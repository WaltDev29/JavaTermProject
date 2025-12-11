package repository;

import java.sql.*;

public class JDBCConnector {
    private static final String DRIVER_PATH = "oracle.jdbc.driver.OracleDriver";
    private static final String URL = "jdbc:oracle:thin:@localhost:1521/xe";
    private static final String USER_NAME = "C##MEAL";
    private static final String PASSWORD = "1234";

    private static Connection con;

    public static Connection getConnection() {
        try {
            Class.forName(DRIVER_PATH);
            System.out.println("JDBC Driver Loaded");

            con = DriverManager.getConnection(URL, USER_NAME, PASSWORD);
            System.out.println("Connection Done Successfully");
        }
        catch (ClassNotFoundException e) {
            System.out.println("Driver Class Not Found");
        }
        catch (SQLException e) {
            System.out.println("Connection Error");
        }
        return con;
    }

    public static void resultSetTest(Connection con) {
        try {
            String sql = "SELECT * from meals";
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                System.out.println("meal_id : " + rs.getInt("meal_id"));
                System.out.println("served_date : " + rs.getDate("served_date"));
                System.out.println("meal_type : " + rs.getString("meal_type"));
                System.out.println();
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public static void main(String[] args) {
        Connection con = getConnection();
        resultSetTest(con);
    }
}
