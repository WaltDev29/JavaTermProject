package repository;

import domain.Meal;
import domain.Review;

import java.sql.*;
import java.util.ArrayList;

public class ReviewRepository {

    public ArrayList<Review> getReviews(Date date, String type) {
        Connection con = JDBCConnector.getConnection();
        PreparedStatement ps;
        ResultSet rs;
        ArrayList<Review> reviewList = new ArrayList<>();

        String sql = "SELECT * FROM review " +
                "LEFT JOIN students s ON r.student_id = s.student_id " +
                "WHERE date = ? AND type = ?";

        try {
            ps = con.prepareStatement(sql);
            ps.setDate(1, date);
            ps.setString(2, type);
            rs = ps.executeQuery();

            while (rs.next()) {
                Review review = new Review(rs.getInt("meal_id"), rs.getString("student_id"), rs.getString("student_name"), rs.getString("comment"), rs.getInt("rating"));
                reviewList.add(review);
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

        return reviewList;
    }

}
