package repository;

import domain.Review;

import java.sql.*;
import java.util.ArrayList;

public class ReviewRepository {

    public ArrayList<Review> getReviews(Date date) {
        Connection con = JDBCConnector.getConnection();
        PreparedStatement ps;
        ResultSet rs;
        ArrayList<Review> reviewList = new ArrayList<>();

        String sql = "SELECT m.meal_id, m.meal_type, s.student_id, s.name, r.review_comment, r.rating " +
                "FROM reviews r " +
                "LEFT JOIN students s ON r.student_id = s.student_id " +
                "LEFT JOIN meals m ON r.meal_id = m.meal_id " +
                "WHERE m.served_date = ?";

        try {
            ps = con.prepareStatement(sql);
            ps.setDate(1, date);
            rs = ps.executeQuery();

            while (rs.next()) {
                Review review = new Review(rs.getInt("meal_id"), rs.getString("meal_type"), rs.getString("student_id"), rs.getString("name"), rs.getString("review_comment"), rs.getInt("rating"));
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
