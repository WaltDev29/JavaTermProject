package controller;

// 일단 사용자 모드 먼저 구현하고 그 다음에 생각합시다.

import domain.Meal;
import presentation.CenterFrame;
import presentation.DayMealView;
import repository.MealRepository;

import javax.swing.*;
import java.sql.Date;
import java.time.LocalDate;
import java.util.ArrayList;

public class MainController extends JFrame {
    // View Pans
    DayMealView dayMealPan;

    // Entities
    MealRepository mealRepo;
    ArrayList<Meal> mealList;

    // Inner Elements

    JTabbedPane tab = new JTabbedPane(JTabbedPane.TOP);

    public MainController() {
        mealRepo = new MealRepository();
        mealList = mealRepo.getMealsbyDate(Date.valueOf(LocalDate.now()));

        dayMealPan = new DayMealView();
        dayMealPan.setMealList(mealList);
        dayMealPan.initView();
        dayMealPan.setTable();


        tab.add("금일 메뉴",dayMealPan);


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
