package controller;

// 일단 사용자 모드 먼저 구현하고 그 다음에 생각합시다.

import domain.Meal;
import domain.Review;
import presentation.CenterFrame;
import presentation.DayMealView;
import presentation.ReviewView;
import presentation.WeekMealView;
import repository.MealRepository;
import repository.ReviewRepository;

import javax.swing.*;
import java.sql.Date;
import java.time.DayOfWeek;
import java.time.LocalDate;
import java.util.ArrayList;

public class MainController extends JFrame {
    // View Pans
    DayMealView dayMealPan;
    WeekMealView weekMealPan;
    ReviewView reviewPan;

    // Entities
    MealRepository mealRepo;
    ReviewRepository reviewRepo;
    ArrayList<Meal> mealList;
    ArrayList<Review> reviewList;
    
    // 변수
    LocalDate today = LocalDate.now();
    LocalDate monday = today.with(DayOfWeek.MONDAY);
    LocalDate friday = today.with(DayOfWeek.FRIDAY);

    // Inner Elements
    JTabbedPane tab = new JTabbedPane(JTabbedPane.TOP);


    public MainController() {
        mealRepo = new MealRepository();
        reviewRepo = new ReviewRepository();
        mealList = mealRepo.getMealsbyDate(Date.valueOf(LocalDate.now()));

        dayMealPan = new DayMealView();
        dayMealPan.setMealList(mealList);
        dayMealPan.initView();
        dayMealPan.setTable();

        tab.add("금일 메뉴",dayMealPan);

        weekMealPan = new WeekMealView();
        mealList = mealRepo.getMealsbyDates(Date.valueOf(monday), Date.valueOf(friday));
        weekMealPan.setMealList(mealList);
        weekMealPan.initView();
        weekMealPan.setMealList(mealList);

        tab.add("금주 메뉴", weekMealPan);

        reviewPan = new ReviewView();

        add(tab);

        // JFrame Layout 설정
        setTitle("오늘의 학식");
        setDefaultCloseOperation(EXIT_ON_CLOSE);

        CenterFrame cf = new CenterFrame(500,500);
        cf.centerPoint();
        setBounds(cf.getX(),cf.getY(),cf.getFw(),cf.getFh());

        setVisible(true);
    }

    public static void main(String[] args) {
        new MainController();
    }
}
