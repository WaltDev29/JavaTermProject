package domain;

public class Review {
    private int review_id;
    private int meal_id;
    private String type;
    private String student_id;
    private String student_name;
    private String comment;
    private int rating;

    public Review(int meal_id, String type, String student_id, String student_name, String comment, int rating) {
        this.meal_id = meal_id;
        this.type = type;
        this.student_id = student_id;
        this.student_name = student_name;
        this.comment = comment;
        this.rating = rating;
    }

    public String getType() {
        return type;
    }

    public String getStudent_name() {
        return student_name;
    }

    public String getComment() {
        return comment;
    }

    public int getRating() {
        return rating;
    }

    // 리뷰 작성 시 INSERT (Date는 자동으로 들어감)
}
