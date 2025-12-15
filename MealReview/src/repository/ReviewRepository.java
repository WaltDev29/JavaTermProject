package repository;

import domain.Review;

import java.sql.*;
import java.util.ArrayList;

public class ReviewRepository {

    // ===================== SELECT 메서드 =====================
    // get Reiviews
    public ArrayList<Review> getReviews(Date date, String student_id, String type) {
        Connection con = JDBCConnector.getConnection();
        PreparedStatement ps;
        ResultSet rs;
        ArrayList<Review> reviewList = new ArrayList<>();

        String sql = "SELECT r.review_id, m.meal_id, m.meal_type, s.student_id, s.name, r.review_comment, r.rating " +
                "FROM reviews r " +
                "LEFT JOIN students s ON r.student_id = s.student_id " +
                "LEFT JOIN meals m ON r.meal_id = m.meal_id " +
                "WHERE m.served_date = ? AND r.student_id LIKE ? AND m.meal_type LIKE ?" +
                "ORDER BY review_id";

        try {
            ps = con.prepareStatement(sql);
            ps.setDate(1, date);
            ps.setString(2, '%' + student_id + '%');
            ps.setString(3, '%' + type + '%');
            rs = ps.executeQuery();

            while (rs.next()) {
                Review review = new Review(rs.getInt("review_id"), rs.getInt("meal_id"), rs.getString("meal_type"), rs.getString("student_id"), rs.getString("name"), rs.getString("review_comment"), rs.getInt("rating"));
                reviewList.add(review);
            }

        } catch (SQLException e) {
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

    // getLastId
    public int getLastId() {
        Connection con = JDBCConnector.getConnection();
        PreparedStatement ps;
        ResultSet rs;
        int id = 0;

        String sql = "SELECT * " +
                "FROM reviews " +
                "WHERE review_id = ( " +
                "    SELECT MAX(review_id) " +
                "    FROM reviews)";

        try {
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();

            while (rs.next()) {
                id = rs.getInt("review_id");
            }

        } catch (SQLException e) {
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

        return id;
    }


    // getIsReviewed
    public boolean[] getIsReviewed(String student_id, Date date) {
        Connection con = JDBCConnector.getConnection();
        PreparedStatement ps;
        ResultSet rs;
        boolean[] isReviewed = {false, false, false};

        String sql = "SELECT m.meal_type " +
                "FROM reviews r " +
                "LEFT JOIN meals m ON r.meal_id = m.meal_id " +
                "WHERE r.student_id = ? AND m.served_date = ?";

        try {
            ps = con.prepareStatement(sql);
            ps.setString(1, student_id);
            ps.setDate(2, date);
            rs = ps.executeQuery();

            while (rs.next()) {
                if (rs.getString("meal_type").equals("조식")) isReviewed[0] = true;
                else if (rs.getString("meal_type").equals("중식")) isReviewed[1] = true;
                else isReviewed[2] = true;
            }

        } catch (SQLException e) {
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

        return isReviewed;
    }


    // ===================== INSERT 메서드 =====================
    public boolean insertReview(int review_id, int meal_id, String student_id, String comment, int rating) {
        Connection con = JDBCConnector.getConnection();
        PreparedStatement ps;
        boolean isDone = true;

        String sql = "INSERT INTO reviews (review_id, meal_id, student_id, review_comment, rating)\n" +
                "VALUES(?, ?, ?, ?, ?)";

        try {
            ps = con.prepareStatement(sql);
            ps.setInt(1, review_id);
            ps.setInt(2, meal_id);
            ps.setString(3, student_id);
            ps.setString(4, comment);
            ps.setInt(5, rating);
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println("====== ERROR ======\n" + e.getMessage());
            isDone = false;
            throw new RuntimeException(e);
        }

        try {
            if (ps != null) ps.close();
            if (con != null) con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return isDone;
    }


    // ===================== UPDATE 메서드 =====================
    public boolean updateReview(int review_id, String comment, int rating) {
        Connection con = JDBCConnector.getConnection();
        PreparedStatement ps;
        boolean isDone = true;

        String sql = "UPDATE reviews " +
                "SET review_comment = ?," +
                "rating = ? " +
                "WHERE review_id = ?";

        try {
            ps = con.prepareStatement(sql);
            ps.setString(1, comment);
            ps.setInt(2, rating);
            ps.setInt(3, review_id);
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println("====== ERROR ======\n" + e.getMessage());
            isDone = false;
            throw new RuntimeException(e);
        }

        try {
            if (ps != null) ps.close();
            if (con != null) con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return isDone;
    }


    // ===================== DELETE 메서드 =====================
    public boolean deleteReview(int review_id) {
        Connection con = JDBCConnector.getConnection();
        PreparedStatement ps;
        boolean isDone = true;

        String sql = "DELETE FROM reviews " +
                "WHERE review_id = ?";

        try {
            ps = con.prepareStatement(sql);
            ps.setInt(1, review_id);
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println("====== ERROR ======\n" + e.getMessage());
            isDone = false;
            throw new RuntimeException(e);
        }

        try {
            if (ps != null) ps.close();
            if (con != null) con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return isDone;
    }

}
