package domain;

public class Review {
    private int review_id;
    private String type;
    private String student_name;
    private String comment;
    private int rating;

    public Review(int review_id, String type,  String student_name, String comment, int rating) {
        this.review_id = review_id;
        this.type = type;
        this.student_name = student_name;
        this.comment = comment;
        this.rating = rating;
    }

    public int getReview_id() {
        return review_id;
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
