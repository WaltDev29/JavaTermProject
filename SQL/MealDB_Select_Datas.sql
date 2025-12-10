SELECT m.served_date, m.meal_type, f.name
FROM meals m, foods f, meal_foods mf
WHERE m.meal_id = mf.meal_id AND mf.food_id = f.food_id;


SELECT 
    m.served_date,
    m.meal_type,
    LISTAGG(f.name, ', ') WITHIN GROUP (ORDER BY f.name) AS food_list
FROM meals m
JOIN meal_foods mf ON m.meal_id = mf.meal_id
JOIN foods f ON mf.food_id = f.food_id
GROUP BY 
    m.served_date,
    m.meal_type
ORDER BY 
    m.served_date,
    m.meal_type;
    

SELECT r.review_id, m.served_date, m.meal_type, r.student_id, r.rating, r.review_comment
FROM meals m, reviews r
WHERE m.meal_id = r.meal_id
ORDER BY r.review_id;
