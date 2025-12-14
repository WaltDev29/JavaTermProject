package domain;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.time.DayOfWeek;
import java.time.LocalDate;
import java.util.ArrayList;

public class Meal {
    private int mealId;
    private Date date;
    private String formatedDate;
    private String dayOfWeek;
    private String type;
    private ArrayList<String> menus;
    private int rating;

    public Meal(int mealId, Date date, String type, int rating) {
        this.mealId = mealId;
        this.date = date;
        this.formatedDate = getFormatedDate(date);
        this.dayOfWeek = getKoreanDay(date);
        this.type = type;
        this.menus = new ArrayList<>();
        this.rating = rating;
    }

    // 비어있는 학식용 객체
    public Meal(Date date) {
        this.mealId = 0;
        this.date = date;
        this.type = "none";
        this.menus = new ArrayList<>();
    }

    private String getFormatedDate(Date date) {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy년 MM월 dd일");
        return sdf.format(date);
    }

    private String getKoreanDay(Date date) {
        LocalDate localDate = date.toLocalDate();
        DayOfWeek dow = localDate.getDayOfWeek();

        return switch (dow) {
            case MONDAY -> "월요일";
            case TUESDAY -> "화요일";
            case WEDNESDAY -> "수요일";
            case THURSDAY -> "목요일";
            case FRIDAY -> "금요일";
            case SATURDAY -> "토요일";
            case SUNDAY -> "일요일";
        };
    }

    public void addMenu(String menu) {
        menus.add(menu);
    }

    public int getMealId() {
        return mealId;
    }

    public Date getDate() {
        return date;
    }

    public String getFormatedDate() {
        return formatedDate;
    }

    public String getDayOfWeek() {
        return dayOfWeek;
    }

    public String getType() {
        return type;
    }

    public ArrayList<String> getMenus() {
        return menus;
    }

    public int getRating() {
        return rating;
    }
}
