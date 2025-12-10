// ============ meals ============ 
INSERT ALL
INTO meals VALUES (1, '2025-09-29', '조식')
INTO meals VALUES (2, '2025-09-29', '중식')
INTO meals VALUES (3, '2025-09-29', '석식')
INTO meals VALUES (4, '2025-09-30', '조식')
INTO meals VALUES (5, '2025-09-30', '중식')
INTO meals VALUES (6, '2025-09-30', '석식')
INTO meals VALUES (7, '2025-10-01', '조식')
INTO meals VALUES (8, '2025-10-01', '중식')
INTO meals VALUES (9, '2025-10-01', '석식')
INTO meals VALUES (10, '2025-10-02', '조식')
INTO meals VALUES (11, '2025-10-02', '중식')
INTO meals VALUES (12, '2025-10-02', '석식')
INTO meals VALUES (13, '2025-10-03', '조식')
INTO meals VALUES (14, '2025-10-03', '중식')
INTO meals VALUES (15, '2025-10-03', '석식')
SELECT * FROM dual;

SELECT * FROM meals;


// ============ foods ============ 
INSERT ALL
INTO foods VALUES (1, '김치')
INTO foods VALUES (2, '잡곡밥')
INTO foods VALUES (3, '콩나물국')
INTO foods VALUES (4, '훈제오리고기')
INTO foods VALUES (5, '감자샐러드')
INTO foods VALUES (6, '상추쌈')
INTO foods VALUES (7, '영양보쌈')
INTO foods VALUES (8, '짜장떡볶이')
INTO foods VALUES (9, '햄버거')
INTO foods VALUES (10, '닭도리탕')
INTO foods VALUES (11, '흰쌀밥')
INTO foods VALUES (12, '감자찌개')
SELECT * FROM dual;

SELECT * FROM foods;


// ============ meal_foods ============ 
INSERT ALL
INTO meal_foods VALUES (1, 1)
INTO meal_foods VALUES (1, 2)
INTO meal_foods VALUES (1, 3)
INTO meal_foods VALUES (1, 4)
INTO meal_foods VALUES (2, 5)
INTO meal_foods VALUES (2, 6)
INTO meal_foods VALUES (2, 7)
INTO meal_foods VALUES (2, 12)
INTO meal_foods VALUES (2, 11)
INTO meal_foods VALUES (3, 1)
INTO meal_foods VALUES (3, 3)
INTO meal_foods VALUES (3, 2)
INTO meal_foods VALUES (3, 10)
SELECT * FROM dual;

SELECT * FROM meal_foods;


// ============ students ============ 
INSERT ALL
INTO students VALUES ('2501110199', '김예진', 'F', '2003-10-09')
INTO students VALUES ('2501110200', '김재영', 'M', '1999-01-20')
INTO students VALUES ('2501110202', '김해민', 'F', '2001-05-07')
INTO students VALUES ('2501110203', '김호석', 'M', '1998-02-22')
INTO students VALUES ('2501110204', '도경진', 'M', '2003-05-01')
INTO students VALUES ('2501110205', '박경구', 'M', '1995-01-01')
INTO students VALUES ('2501110206', '박성준', 'M', '2005-03-10')
INTO students VALUES ('2501110209', '박준범', 'M', '2001-07-11')
INTO students VALUES ('2501110210', '박찬웅', 'M', '2002-08-28')
INTO students VALUES ('2501110213', '신동경', 'M', '2001-10-10')
INTO students VALUES ('2501110215', '유상훈', 'M', '2005-11-11')
SELECT * FROM dual;

SELECT * FROM students;


// ============ accounts ============ 
INSERT ALL
INTO accounts VALUES('2501110199', 'f3a9c2e1-89bd-4f7a-a12c-5d9e7b2fa44c', '25/12/03', '25/12/03')
INTO accounts VALUES('2501110200', 'ZF82kq1!dR0x_77hA4pL9mC3uT8vB1', '25/12/03', '25/12/03')
INTO accounts VALUES('2501110202', 'hX7p-33weA0t-Fk92Lm4Qz!r0uYb55P', '25/12/01', '25/12/01')
INTO accounts VALUES('2501110203', '0xA3F1B9D7C28E44FA1D5091EE72C4B903', '25/12/02', '25/12/02')
SELECT * FROM dual;

SELECT * FROM accounts;


// ============ reviews ============ 
INSERT ALL
INTO reviews VALUES(1, 1, '2501110203', 10, '밥 맛있어요!', '25/12/02')
INTO reviews VALUES(2, 2, '2501110200', 1, '최악', '25/12/01')
INTO reviews VALUES(3, 3, '2501110202', 5, '굿굿', '25/12/02')
INTO reviews VALUES(4, 1, '2501110199', 6, '고기 많이 주세요.', '25/12/02')
SELECT * FROM dual;

SELECT * FROM reviews;