package repository;

import domain.Meal;

import java.sql.*;
import java.util.ArrayList;
import java.util.Calendar;

public class MealRepository {

    // todo 메뉴가 비어있을 경우 빈 메뉴라는 것을 설정해야 함. (빈 메뉴일 경우 리뷰 못하도록)
    // ===================== SELECT 메서드 =====================

    // ============ 공용 메서드 ============
    private ArrayList<Meal> getMeals(String sql, Date startdate, Date endDate) {
        // === 변수 준비 ===
        Connection con = JDBCConnector.getConnection();
        PreparedStatement ps;
        ResultSet rs;
        ArrayList<Meal> mealList = new ArrayList<>();

        try {
            ps = con.prepareStatement(sql);
            ps.setDate(1, startdate);
            if (endDate != null) ps.setDate(2, endDate);
            rs = ps.executeQuery();
            
            // === Meal 객체 생성 ===
            Meal currentMeal = null;
            int lastMealId = -1;

            while (rs.next()) {
                int mealId = rs.getInt("meal_id");

                // 새로운 ID일 경우 새로 객체 생성
                if (mealId != lastMealId) {
                    currentMeal = new Meal(
                            mealId,
                            rs.getDate("served_date"),
                            rs.getString("meal_type")
                    );
                    mealList.add(currentMeal);
                    lastMealId = mealId;
                }

                // 메뉴 추가
                String menu = rs.getString("name");
                if (menu != null) {
                    currentMeal.addMenu(menu);
                }
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

        return mealList;
    }

    // ============ SELECT 금일 메뉴 ============
    public ArrayList<Meal> getMealsbyDate(Date day) {
        String sql = "SELECT m.meal_id, m.served_date, m.meal_type, f.name " +
                "FROM meals m " +
                "LEFT JOIN meal_foods mf ON m.meal_id = mf.meal_id " +
                "LEFT JOIN foods f ON mf.food_id = f.food_id " +
                "WHERE m.served_date = ? " +
                "ORDER BY m.meal_id";

        return getMeals(sql, day, null);
    }


    // ============ SELECT 기간 메뉴 ============
    public ArrayList<Meal> getMealsbyDates(Date startDate, Date endDate) {
        if (endDate == null) {
            Calendar cal = Calendar.getInstance();
            cal.setTime(startDate);
            cal.add(Calendar.DATE, 4);
            endDate = new Date(cal.getTimeInMillis());
        }

        String sql = "SELECT m.meal_id, m.served_date, m.meal_type, f.name " +
                        "FROM meals m " +
                        "LEFT JOIN meal_foods mf ON m.meal_id = mf.meal_id " +
                        "LEFT JOIN foods f ON mf.food_id = f.food_id " +
                        "WHERE m.served_date BETWEEN ? AND ? " +
                        "ORDER BY m.served_date, m.meal_type";
        return getMeals(sql, startDate, endDate);
    }



    // ===================== Test =====================
    public static void main(String[] args) {
        MealRepository mr = new MealRepository();
        String day = "2025-09-29";
        Date date = Date.valueOf(day);
        ArrayList<Meal> mealList = mr.getMealsbyDates(date, null);

        for (Meal m : mealList) {
            System.out.println(m.getDate());
            System.out.println(m.getDayOfWeek());
            System.out.println(m.getType());
            System.out.println(m.getMenus());
        }
    }

}
