package domain;

public class Review {
    private int review_id;
    private int meal_id;
    private String student_id;
    private String student_name;
    private String comment;
    private int rating;

    public Review(int meal_id, String student_id, String student_name, String comment, int rating) {
        this.meal_id = meal_id;
        this.student_id = student_id;
        this.student_name = student_name;
        this.comment = comment;
        this.rating = rating;
    }



    // 리뷰 작성 시 INSERT (Date는 자동으로 들어감)
}
