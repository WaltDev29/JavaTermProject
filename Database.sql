--------------------------------------------------------
--  파일이 생성됨 - 월요일-12월-15-2025   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table ACCOUNTS
--------------------------------------------------------

  CREATE TABLE "C##MEAL"."ACCOUNTS" 
   (	"STUDENT_ID" VARCHAR2(10 BYTE), 
	"PASSWORD_HASH" VARCHAR2(255 BYTE), 
	"CREATED_AT" TIMESTAMP (6) DEFAULT SYSTIMESTAMP, 
	"LAST_LOGIN" TIMESTAMP (6)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table FOODS
--------------------------------------------------------

  CREATE TABLE "C##MEAL"."FOODS" 
   (	"FOOD_ID" NUMBER(*,0), 
	"NAME" VARCHAR2(50 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table MEALS
--------------------------------------------------------

  CREATE TABLE "C##MEAL"."MEALS" 
   (	"MEAL_ID" NUMBER(*,0), 
	"SERVED_DATE" DATE, 
	"MEAL_TYPE" VARCHAR2(10 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table MEAL_FOODS
--------------------------------------------------------

  CREATE TABLE "C##MEAL"."MEAL_FOODS" 
   (	"MEAL_ID" NUMBER(*,0), 
	"FOOD_ID" NUMBER(*,0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table REVIEWS
--------------------------------------------------------

  CREATE TABLE "C##MEAL"."REVIEWS" 
   (	"REVIEW_ID" NUMBER(*,0), 
	"MEAL_ID" NUMBER(*,0), 
	"STUDENT_ID" VARCHAR2(10 BYTE), 
	"RATING" NUMBER(*,0), 
	"REVIEW_COMMENT" VARCHAR2(500 BYTE), 
	"CREATED_AT" TIMESTAMP (6) DEFAULT SYSTIMESTAMP
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table STUDENTS
--------------------------------------------------------

  CREATE TABLE "C##MEAL"."STUDENTS" 
   (	"STUDENT_ID" VARCHAR2(10 BYTE), 
	"NAME" VARCHAR2(20 BYTE), 
	"GENDER" VARCHAR2(1 BYTE), 
	"BIRTH_DATE" DATE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
REM INSERTING into C##MEAL.ACCOUNTS
SET DEFINE OFF;
Insert into C##MEAL.ACCOUNTS (STUDENT_ID,PASSWORD_HASH,CREATED_AT,LAST_LOGIN) values ('2501110199','$2a$10$o5PxQ2T5ZB8gFImX.terNOv/EP9063fUBHKKPY1aLwEzqVZU.kKky',to_timestamp('25/12/15 20:55:32.350000000','RR/MM/DD HH24:MI:SSXFF'),null);
Insert into C##MEAL.ACCOUNTS (STUDENT_ID,PASSWORD_HASH,CREATED_AT,LAST_LOGIN) values ('2501110200','$2a$10$jZ8tvU3Ip.006t07fyBszuSfC/ZqgFQxuaNpAuWWYCOrccuNUiVUS',to_timestamp('25/12/15 20:55:58.325000000','RR/MM/DD HH24:MI:SSXFF'),null);
Insert into C##MEAL.ACCOUNTS (STUDENT_ID,PASSWORD_HASH,CREATED_AT,LAST_LOGIN) values ('2501110202','$2a$10$cHryA5Nha17rEfTDKOWOT.DUk3PtYR9U.r9q02jYwfs00Pu0ihrku',to_timestamp('25/12/15 20:57:49.392000000','RR/MM/DD HH24:MI:SSXFF'),null);
Insert into C##MEAL.ACCOUNTS (STUDENT_ID,PASSWORD_HASH,CREATED_AT,LAST_LOGIN) values ('2501110205','$2a$10$/QhwOLnTNT2KqlH40bPhmuu5LCYW7zgNE7d.ikqs7Vx3P2HTj7MT.',to_timestamp('25/12/15 20:58:07.123000000','RR/MM/DD HH24:MI:SSXFF'),null);
Insert into C##MEAL.ACCOUNTS (STUDENT_ID,PASSWORD_HASH,CREATED_AT,LAST_LOGIN) values ('2501110206','$2a$10$O3CxTbmQL7a3LM/Ds3j.m.fl8WpiOxlBfApP2daxXQyEMy8tcRKKi',to_timestamp('25/12/15 20:58:26.713000000','RR/MM/DD HH24:MI:SSXFF'),null);
Insert into C##MEAL.ACCOUNTS (STUDENT_ID,PASSWORD_HASH,CREATED_AT,LAST_LOGIN) values ('2501110209','$2a$10$RJo6RqNkfQr4uZR8f58.KeU6i02jt3ink9tiSDSA7ieHLcL4dKEUC',to_timestamp('25/12/15 20:58:40.482000000','RR/MM/DD HH24:MI:SSXFF'),null);
Insert into C##MEAL.ACCOUNTS (STUDENT_ID,PASSWORD_HASH,CREATED_AT,LAST_LOGIN) values ('2501110210','$2a$10$6DyFGl6qsBPoVsqzFhgKjeoNUA.3BX.IHkPU3/HAPWLN5G9wC26Xy',to_timestamp('25/12/15 20:58:52.809000000','RR/MM/DD HH24:MI:SSXFF'),null);
Insert into C##MEAL.ACCOUNTS (STUDENT_ID,PASSWORD_HASH,CREATED_AT,LAST_LOGIN) values ('2501110215','$2a$10$hEbpWb6/J8qnaCOE16wxVOToZRM3Y832Os48d/yKwPVZX16Tix1Ay',to_timestamp('25/12/15 20:59:13.466000000','RR/MM/DD HH24:MI:SSXFF'),null);
Insert into C##MEAL.ACCOUNTS (STUDENT_ID,PASSWORD_HASH,CREATED_AT,LAST_LOGIN) values ('2501110204','$2a$10$HNZEoq8QGmwTy.LxcMPeCeNm651JRoIg3g.K5whqdonTEhRXhwRwG',to_timestamp('25/12/14 18:28:35.387000000','RR/MM/DD HH24:MI:SSXFF'),null);
Insert into C##MEAL.ACCOUNTS (STUDENT_ID,PASSWORD_HASH,CREATED_AT,LAST_LOGIN) values ('2501110203','$2a$10$TYOFGj40q6AT4S1a477tmezzinfbS5kIVTANXriDegXNQd0C43P5C',to_timestamp('25/12/15 20:18:38.707000000','RR/MM/DD HH24:MI:SSXFF'),null);
REM INSERTING into C##MEAL.FOODS
SET DEFINE OFF;
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (1,'쌀밥');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (2,'김치어묵국');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (3,'대패삼겹살청경채볶음');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (4,'콩조림');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (5,'부추무침');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (6,'김치');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (7,'잡곡밥');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (8,'쇠고기근대국');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (9,'제육느타리볶음');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (10,'잡채');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (11,'콩나물무침');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (12,'버섯계란국');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (13,'닭갈비');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (14,'스크램블에그');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (15,'호박맛살볶음');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (16,'쇠고기무우국');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (17,'훈제오리볶음');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (18,'어묵야채볶음');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (19,'그린샐러드');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (20,'스팸감자짜글이');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (21,'닭도리탕');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (22,'해물볶음우동');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (23,'무말랭이무침');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (24,'콩비지찌개');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (25,'가라아게');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (26,'미트볼야채볶음');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (27,'단호박샐러드');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (28,'닭죽');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (29,'감자베이컨볶음');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (30,'지짐만두');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (31,'양념깻잎지');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (32,'(추가밥)');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (33,'옥수수크림스프');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (34,'토마토파스타');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (35,'멘치까스');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (36,'츄러스');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (37,'계란라면');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (38,'김밥');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (39,'단무지');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (40,'야쿠르트');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (41,'북어해장국');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (42,'치킨너겟&머스타드');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (43,'햄감자볶음');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (44,'요플레');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (45,'홍합미역국');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (46,'대패삼겹살제육볶음');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (47,'오징어링튀김');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (48,'아삭이고추무침');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (49,'케이준샌드위치');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (50,'음료');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (51,'아욱새우국');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (52,'떡갈비&소스');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (53,'해쉬브라운/김구이');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (54,'버섯샤브국');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (55,'삼겹살제육볶음');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (56,'찐만두');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (57,'미소장국');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (58,'들기름막국수');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (59,'마늘쫑무침');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (60,'매운콩나물국');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (61,'제육볶음');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (62,'바나나우유');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (63,'햄야채볶음밥&짜장소스');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (64,'유부국');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (65,'통살새우까스');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (66,'숙주굴소스볶음');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (67,'플레인요플레');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (68,'동태매운탕');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (69,'탕수육&소스');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (70,'두부구이');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (71,'부추겉절이');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (72,'된장국');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (73,'닭살데리야끼볶음');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (74,'고구마고로케');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (75,'오징어콩나물찜');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (76,'연두부&양념장');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (77,'김치무우국');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (78,'닭가슴살구이');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (79,'그린빈메알조림');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (80,'애호박된장찌개');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (81,'언양식바싹불고기');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (82,'비엔나볶음');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (83,'오렌지');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (84,'참치마요덮밥');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (85,'콩나물김치국');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (86,'국물떡볶이');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (87,'고구마맛탕');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (88,'김치찌개');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (89,'쇠고기야채볶음');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (90,'계란찜');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (91,'오징어젓무무침');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (92,'홍합무우국');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (93,'어묵볶음');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (94,'계란후라이');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (95,'사골배추된장국');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (96,'순살치킨가스&소스');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (97,'도토리묵무침');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (98,'코우슬로우샐러드');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (99,'오징어국');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (100,'탕수육');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (101,'김치전');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (102,'쇠고기대파국');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (103,'폭찹미트볼볶음');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (104,'멸치견과볶음');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (105,'마카로니샐러드');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (106,'쇠고기미역국');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (107,'동그란전');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (108,'꼬치어묵탕');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (109,'안동닭찜');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (110,'꽃맛살샐러드');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (111,'후리카케밥');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (112,'쌀국수');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (113,'짜조&카레고로케');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (114,'가공커피우유');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (115,'김치유부국');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (116,'파인애플&치즈함박스테이크');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (117,'토마토팬네파스타');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (118,'모듬감자튀김');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (119,'콩나물국');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (120,'대패삼겹살볶음');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (121,'상추쌈&저염쌈장');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (122,'쇠고기떡만두국');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (123,'닭다리살볶음');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (124,'에그그린샐러드');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (125,'반건시');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (126,'어향가지쇠고기덮밥');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (127,'게살스프');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (128,'납작지짐만두');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (129,'연두부샐러드');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (130,'닭바베큐구이');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (131,'계란만두');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (132,'순두부찌개');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (133,'돈육볶음우동');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (134,'꼬마돈까스');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (135,'뚱뚱한바나나우유');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (136,'김치두부국');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (137,'닭장각바베큐구이');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (138,'오이양파무침');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (139,'스위트콘샐러드');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (140,'총각김치');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (141,'깍두기돈육볶음밥');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (142,'참치사라다빵');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (143,'짜사이무침');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (144,'쥬시쿨');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (145,'매콤시금치국');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (146,'닭볶음탕');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (147,'카레라이스');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (148,'홍합무국');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (149,'고추잡채&또띠아');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (150,'열무된장국');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (151,'돈까스');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (152,'오이피클');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (153,'쇠고기무국');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (154,'휴게소버터감자');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (155,'부대찌개');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (156,'삼겹살새송이구이');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (157,'실곤약무침');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (158,'숙주나물');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (159,'쇠고기야채죽');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (160,'우동국물');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (161,'너비아니구이');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (162,'모듬플라워&초장');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (163,'새우야채볶음밥');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (164,'두부팽이버섯국');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (165,'치즈함박스테이크');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (166,'바나나');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (167,'아욱얼갈이국');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (168,'두부돈육조림');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (169,'제육떡조림');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (170,'옛날소시지전');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (171,'쇠고기배추국');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (172,'무미나리생채');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (173,'베이컨갈릭볶음밥');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (174,'치킨까스');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (175,'들깨양배추샐러드');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (176,'얼큰콩나물국');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (177,'숫불바싹불고기');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (178,'어묵계란전');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (179,'양상추샐러드');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (180,'차돌버섯국');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (181,'김치삼겹살볶음');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (182,'김/검정깨두유');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (183,'북어콩나물국');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (184,'볶음짬뽕');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (185,'무비트무침');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (186,'야채볶음밥');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (187,'옥수수스프');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (188,'바게트빵');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (189,'순살돈까스');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (190,'돈육폭찹볶음');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (191,'베이컨감자채볶음');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (192,'계란버섯국');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (193,'불맛바싹불고기볶음');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (194,'상추쌈&쌈장');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (195,'열무김치');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (196,'깐풍기');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (197,'얼갈이무침');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (198,'얼큰쇠고기근대국');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (199,'떡갈비구이');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (200,'감자채볶음');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (201,'꿀호떡&흰우유');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (202,'하이라이스');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (203,'매콤콩나물국');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (204,'생선까스');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (205,'참나물무침');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (206,'붕어빵');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (207,'돼지짜글이');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (208,'오징어가스');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (209,'상추겉절이');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (210,'꽃게찌개');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (211,'쇠고기볶음');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (212,'부추양파무침');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (213,'육개장');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (214,'돈육간장볶음');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (215,'양배추쌈&쌈장');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (216,'얼갈이된장무침');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (217,'어묵무우국');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (218,'치킨너겟야채볶음');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (219,'김구이');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (220,'삶은계란');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (221,'청양마요치킨덮밥');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (222,'얼큰쇠고기장국');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (223,'타코야끼');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (224,'맛살컬리볶음');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (225,'팝콘치킨');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (226,'견과멸치볶음');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (227,'그린샐러드//핫바');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (228,'나가사끼짬뽕국');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (229,'돈까스&소스');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (230,'빌소시지볶음');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (231,'양배추샐러드');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (232,'오무라이스');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (233,'미소된장국');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (234,'참치미역국');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (235,'닭카레조림');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (236,'알감자간장조림');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (237,'닭다리구이');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (238,'두부양념조림');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (239,'야채된장국');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (240,'얼큰아욱국');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (241,'제육버섯볶음');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (242,'찐양배추쌈&쌈장');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (243,'콩나물파채무침');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (244,'순두부맑은국');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (245,'돈육메알조림');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (246,'조랭이떡고추장볶음');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (247,'호박새우젓국');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (248,'떡갈비&파인애플');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (249,'닭개장');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (250,'도시락김/야쿠르트');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (251,'얼큰쇠고기무우국');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (252,'닭오븐구이');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (253,'감자조림');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (254,'미역양파무침');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (255,'사골떡만두국');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (256,'치킨너겟');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (257,'마늘빵');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (258,'가공우유');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (259,'피홍합국');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (260,'닭살김치볶음');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (261,'마파두부');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (262,'단무지무침');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (263,'스팸돈부리덮밥');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (264,'미트볼볶음');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (265,'탄산음료');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (266,'고추장배추국');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (267,'대패삼겹살버섯볶음');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (268,'곱샐러드');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (269,'구운계란&요플레');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (270,'매콤차돌버섯국');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (271,'소떡소떡');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (272,'모듬콜리참깨샐러드');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (273,'고기왕만두');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (274,'제육고추장볶음');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (275,'초코파이');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (276,'시금치된장국');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (277,'고등어구이');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (278,'온두부');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (279,'볶은김치');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (280,'전주식콩나물국밥');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (281,'무생채');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (282,'오렌지쥬스');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (283,'돈육야채볶음');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (284,'고추장불고기');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (285,'해쉬브라운');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (286,'돈육김치찌개');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (287,'떡갈비');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (288,'콩나물무국');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (289,'오리훈제구이');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (290,'갈비만두');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (291,'호박버섯볶음');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (292,'북어계란국');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (293,'오징어삼겹살볶음');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (294,'야채튀김');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (295,'얼큰시금치국');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (296,'콘마카로니샐러드');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (297,'돌나물&초장');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (298,'햄야채볶음밥');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (299,'유부김치국');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (300,'구운고구마');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (301,'감자탕');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (302,'청포묵검정깨무침');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (303,'된장찌개');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (304,'바싹불고기');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (305,'해초오이샐러드');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (306,'소불고기볶음');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (307,'피자식빵/(커피)우유');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (308,'왕새우튀김');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (309,'숙주나물무침');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (310,'주먹밥');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (311,'잔치국수');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (312,'왕만두');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (313,'돈육곤약장조림');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (314,'스크램블');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (315,'멕시칸샐러드');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (316,'매운당면잡채');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (317,'사과파이/야쿠르트');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (318,'김치두부찌개');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (319,'새우까스');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (320,'콘푸라이트야채샐러드');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (321,'추가밥');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (322,'떡만두국');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (323,'더덕고추장무침');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (324,'감귤');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (325,'불닭볶음');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (326,'유채나물무침');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (327,'참치김치국');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (328,'갈치조림');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (329,'동그랑땡케찹볶음');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (330,'돈육장조림');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (331,'그린망고샐러드');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (332,'햄버거');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (333,'닭다리후라이드');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (334,'오이지무침');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (335,'훈제오리고기');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (336,'감자샐러드');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (337,'영양보쌈');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (338,'상추쌈');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (339,'감자찌개');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (340,'짜장떡볶이');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (341,'미트볼비엔나볶음');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (342,'메추리알조림');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (343,'미소국');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (344,'호빵');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (345,'짜조');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (346,'아욱국');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (347,'고등어무조림');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (348,'후레이크그린샐러드');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (349,'시금치콩나물국');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (350,'비엔나브로콜리볶음');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (351,'핫바');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (352,'닭살고추장볶음');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (353,'김치부추전');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (354,'야채된장찌개');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (355,'북어채해장국');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (356,'돈육떡조림');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (357,'웨지감자구이');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (358,'김치국');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (359,'직화돈불고기');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (360,'초코우유');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (361,'후리가케밥');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (362,'토마토스파게티');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (363,'크래미샐러드');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (364,'숙주무침');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (365,'새우볶음밥');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (366,'두부미소국');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (367,'숯불구이후랑크');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (368,'새싹샐러드');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (369,'감자된장찌개');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (370,'팽이버섯맛살전');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (371,'깻잎지');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (372,'김치밥버거');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (373,'계란국');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (374,'해쉬브라운&케찹');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (375,'미역국');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (376,'어묵탕');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (377,'두부양념구이');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (378,'붕어빵/야쿠르트');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (379,'김치콩비지찌개');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (380,'참치계란볶음');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (381,'야채북어채무침');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (382,'호박버섯장국');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (383,'커피우유');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (384,'너비아니야채볶음');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (385,'고로케');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (386,'제육덮밥');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (387,'아욱된장국');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (388,'언양식떡갈비구이');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (389,'단호박찜');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (390,'감자튀김');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (391,'감자새우젓맑은국');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (392,'김치부침개');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (393,'잡채덮밥');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (394,'&계란후라이');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (395,'매콤홍합채소국');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (396,'검은깨오징어가스');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (397,'콩나물겨자무침');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (398,'다시마무우국');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (399,'도토리묵김가루무침');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (400,'닭칼국수');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (401,'감자채야채전');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (402,'새송이맛살볶음');
Insert into C##MEAL.FOODS (FOOD_ID,NAME) values (403,'후르츠칵테일');
REM INSERTING into C##MEAL.MEALS
SET DEFINE OFF;
Insert into C##MEAL.MEALS (MEAL_ID,SERVED_DATE,MEAL_TYPE) values (3,to_date('25/09/29','RR/MM/DD'),'석식');
Insert into C##MEAL.MEALS (MEAL_ID,SERVED_DATE,MEAL_TYPE) values (1,to_date('25/09/29','RR/MM/DD'),'조식');
Insert into C##MEAL.MEALS (MEAL_ID,SERVED_DATE,MEAL_TYPE) values (2,to_date('25/09/29','RR/MM/DD'),'중식');
Insert into C##MEAL.MEALS (MEAL_ID,SERVED_DATE,MEAL_TYPE) values (6,to_date('25/09/30','RR/MM/DD'),'석식');
Insert into C##MEAL.MEALS (MEAL_ID,SERVED_DATE,MEAL_TYPE) values (4,to_date('25/09/30','RR/MM/DD'),'조식');
Insert into C##MEAL.MEALS (MEAL_ID,SERVED_DATE,MEAL_TYPE) values (5,to_date('25/09/30','RR/MM/DD'),'중식');
Insert into C##MEAL.MEALS (MEAL_ID,SERVED_DATE,MEAL_TYPE) values (9,to_date('25/10/01','RR/MM/DD'),'석식');
Insert into C##MEAL.MEALS (MEAL_ID,SERVED_DATE,MEAL_TYPE) values (7,to_date('25/10/01','RR/MM/DD'),'조식');
Insert into C##MEAL.MEALS (MEAL_ID,SERVED_DATE,MEAL_TYPE) values (8,to_date('25/10/01','RR/MM/DD'),'중식');
Insert into C##MEAL.MEALS (MEAL_ID,SERVED_DATE,MEAL_TYPE) values (12,to_date('25/10/02','RR/MM/DD'),'석식');
Insert into C##MEAL.MEALS (MEAL_ID,SERVED_DATE,MEAL_TYPE) values (10,to_date('25/10/02','RR/MM/DD'),'조식');
Insert into C##MEAL.MEALS (MEAL_ID,SERVED_DATE,MEAL_TYPE) values (11,to_date('25/10/02','RR/MM/DD'),'중식');
Insert into C##MEAL.MEALS (MEAL_ID,SERVED_DATE,MEAL_TYPE) values (15,to_date('25/10/13','RR/MM/DD'),'석식');
Insert into C##MEAL.MEALS (MEAL_ID,SERVED_DATE,MEAL_TYPE) values (13,to_date('25/10/13','RR/MM/DD'),'조식');
Insert into C##MEAL.MEALS (MEAL_ID,SERVED_DATE,MEAL_TYPE) values (14,to_date('25/10/13','RR/MM/DD'),'중식');
Insert into C##MEAL.MEALS (MEAL_ID,SERVED_DATE,MEAL_TYPE) values (18,to_date('25/10/14','RR/MM/DD'),'석식');
Insert into C##MEAL.MEALS (MEAL_ID,SERVED_DATE,MEAL_TYPE) values (16,to_date('25/10/14','RR/MM/DD'),'조식');
Insert into C##MEAL.MEALS (MEAL_ID,SERVED_DATE,MEAL_TYPE) values (17,to_date('25/10/14','RR/MM/DD'),'중식');
Insert into C##MEAL.MEALS (MEAL_ID,SERVED_DATE,MEAL_TYPE) values (21,to_date('25/10/15','RR/MM/DD'),'석식');
Insert into C##MEAL.MEALS (MEAL_ID,SERVED_DATE,MEAL_TYPE) values (19,to_date('25/10/15','RR/MM/DD'),'조식');
Insert into C##MEAL.MEALS (MEAL_ID,SERVED_DATE,MEAL_TYPE) values (20,to_date('25/10/15','RR/MM/DD'),'중식');
Insert into C##MEAL.MEALS (MEAL_ID,SERVED_DATE,MEAL_TYPE) values (24,to_date('25/10/16','RR/MM/DD'),'석식');
Insert into C##MEAL.MEALS (MEAL_ID,SERVED_DATE,MEAL_TYPE) values (22,to_date('25/10/16','RR/MM/DD'),'조식');
Insert into C##MEAL.MEALS (MEAL_ID,SERVED_DATE,MEAL_TYPE) values (23,to_date('25/10/16','RR/MM/DD'),'중식');
Insert into C##MEAL.MEALS (MEAL_ID,SERVED_DATE,MEAL_TYPE) values (27,to_date('25/10/17','RR/MM/DD'),'석식');
Insert into C##MEAL.MEALS (MEAL_ID,SERVED_DATE,MEAL_TYPE) values (25,to_date('25/10/17','RR/MM/DD'),'조식');
Insert into C##MEAL.MEALS (MEAL_ID,SERVED_DATE,MEAL_TYPE) values (26,to_date('25/10/17','RR/MM/DD'),'중식');
Insert into C##MEAL.MEALS (MEAL_ID,SERVED_DATE,MEAL_TYPE) values (30,to_date('25/10/20','RR/MM/DD'),'석식');
Insert into C##MEAL.MEALS (MEAL_ID,SERVED_DATE,MEAL_TYPE) values (28,to_date('25/10/20','RR/MM/DD'),'조식');
Insert into C##MEAL.MEALS (MEAL_ID,SERVED_DATE,MEAL_TYPE) values (29,to_date('25/10/20','RR/MM/DD'),'중식');
Insert into C##MEAL.MEALS (MEAL_ID,SERVED_DATE,MEAL_TYPE) values (33,to_date('25/10/21','RR/MM/DD'),'석식');
Insert into C##MEAL.MEALS (MEAL_ID,SERVED_DATE,MEAL_TYPE) values (31,to_date('25/10/21','RR/MM/DD'),'조식');
Insert into C##MEAL.MEALS (MEAL_ID,SERVED_DATE,MEAL_TYPE) values (32,to_date('25/10/21','RR/MM/DD'),'중식');
Insert into C##MEAL.MEALS (MEAL_ID,SERVED_DATE,MEAL_TYPE) values (36,to_date('25/10/22','RR/MM/DD'),'석식');
Insert into C##MEAL.MEALS (MEAL_ID,SERVED_DATE,MEAL_TYPE) values (34,to_date('25/10/22','RR/MM/DD'),'조식');
Insert into C##MEAL.MEALS (MEAL_ID,SERVED_DATE,MEAL_TYPE) values (35,to_date('25/10/22','RR/MM/DD'),'중식');
Insert into C##MEAL.MEALS (MEAL_ID,SERVED_DATE,MEAL_TYPE) values (39,to_date('25/10/23','RR/MM/DD'),'석식');
Insert into C##MEAL.MEALS (MEAL_ID,SERVED_DATE,MEAL_TYPE) values (37,to_date('25/10/23','RR/MM/DD'),'조식');
Insert into C##MEAL.MEALS (MEAL_ID,SERVED_DATE,MEAL_TYPE) values (38,to_date('25/10/23','RR/MM/DD'),'중식');
Insert into C##MEAL.MEALS (MEAL_ID,SERVED_DATE,MEAL_TYPE) values (42,to_date('25/10/24','RR/MM/DD'),'석식');
Insert into C##MEAL.MEALS (MEAL_ID,SERVED_DATE,MEAL_TYPE) values (40,to_date('25/10/24','RR/MM/DD'),'조식');
Insert into C##MEAL.MEALS (MEAL_ID,SERVED_DATE,MEAL_TYPE) values (41,to_date('25/10/24','RR/MM/DD'),'중식');
Insert into C##MEAL.MEALS (MEAL_ID,SERVED_DATE,MEAL_TYPE) values (45,to_date('25/10/27','RR/MM/DD'),'석식');
Insert into C##MEAL.MEALS (MEAL_ID,SERVED_DATE,MEAL_TYPE) values (43,to_date('25/10/27','RR/MM/DD'),'조식');
Insert into C##MEAL.MEALS (MEAL_ID,SERVED_DATE,MEAL_TYPE) values (44,to_date('25/10/27','RR/MM/DD'),'중식');
Insert into C##MEAL.MEALS (MEAL_ID,SERVED_DATE,MEAL_TYPE) values (48,to_date('25/10/28','RR/MM/DD'),'석식');
Insert into C##MEAL.MEALS (MEAL_ID,SERVED_DATE,MEAL_TYPE) values (46,to_date('25/10/28','RR/MM/DD'),'조식');
Insert into C##MEAL.MEALS (MEAL_ID,SERVED_DATE,MEAL_TYPE) values (47,to_date('25/10/28','RR/MM/DD'),'중식');
Insert into C##MEAL.MEALS (MEAL_ID,SERVED_DATE,MEAL_TYPE) values (51,to_date('25/10/29','RR/MM/DD'),'석식');
Insert into C##MEAL.MEALS (MEAL_ID,SERVED_DATE,MEAL_TYPE) values (49,to_date('25/10/29','RR/MM/DD'),'조식');
Insert into C##MEAL.MEALS (MEAL_ID,SERVED_DATE,MEAL_TYPE) values (50,to_date('25/10/29','RR/MM/DD'),'중식');
Insert into C##MEAL.MEALS (MEAL_ID,SERVED_DATE,MEAL_TYPE) values (54,to_date('25/10/30','RR/MM/DD'),'석식');
Insert into C##MEAL.MEALS (MEAL_ID,SERVED_DATE,MEAL_TYPE) values (52,to_date('25/10/30','RR/MM/DD'),'조식');
Insert into C##MEAL.MEALS (MEAL_ID,SERVED_DATE,MEAL_TYPE) values (53,to_date('25/10/30','RR/MM/DD'),'중식');
Insert into C##MEAL.MEALS (MEAL_ID,SERVED_DATE,MEAL_TYPE) values (57,to_date('25/10/31','RR/MM/DD'),'석식');
Insert into C##MEAL.MEALS (MEAL_ID,SERVED_DATE,MEAL_TYPE) values (55,to_date('25/10/31','RR/MM/DD'),'조식');
Insert into C##MEAL.MEALS (MEAL_ID,SERVED_DATE,MEAL_TYPE) values (56,to_date('25/10/31','RR/MM/DD'),'중식');
Insert into C##MEAL.MEALS (MEAL_ID,SERVED_DATE,MEAL_TYPE) values (60,to_date('25/11/03','RR/MM/DD'),'석식');
Insert into C##MEAL.MEALS (MEAL_ID,SERVED_DATE,MEAL_TYPE) values (58,to_date('25/11/03','RR/MM/DD'),'조식');
Insert into C##MEAL.MEALS (MEAL_ID,SERVED_DATE,MEAL_TYPE) values (59,to_date('25/11/03','RR/MM/DD'),'중식');
Insert into C##MEAL.MEALS (MEAL_ID,SERVED_DATE,MEAL_TYPE) values (63,to_date('25/11/04','RR/MM/DD'),'석식');
Insert into C##MEAL.MEALS (MEAL_ID,SERVED_DATE,MEAL_TYPE) values (61,to_date('25/11/04','RR/MM/DD'),'조식');
Insert into C##MEAL.MEALS (MEAL_ID,SERVED_DATE,MEAL_TYPE) values (62,to_date('25/11/04','RR/MM/DD'),'중식');
Insert into C##MEAL.MEALS (MEAL_ID,SERVED_DATE,MEAL_TYPE) values (66,to_date('25/11/05','RR/MM/DD'),'석식');
Insert into C##MEAL.MEALS (MEAL_ID,SERVED_DATE,MEAL_TYPE) values (64,to_date('25/11/05','RR/MM/DD'),'조식');
Insert into C##MEAL.MEALS (MEAL_ID,SERVED_DATE,MEAL_TYPE) values (65,to_date('25/11/05','RR/MM/DD'),'중식');
Insert into C##MEAL.MEALS (MEAL_ID,SERVED_DATE,MEAL_TYPE) values (69,to_date('25/11/06','RR/MM/DD'),'석식');
Insert into C##MEAL.MEALS (MEAL_ID,SERVED_DATE,MEAL_TYPE) values (67,to_date('25/11/06','RR/MM/DD'),'조식');
Insert into C##MEAL.MEALS (MEAL_ID,SERVED_DATE,MEAL_TYPE) values (68,to_date('25/11/06','RR/MM/DD'),'중식');
Insert into C##MEAL.MEALS (MEAL_ID,SERVED_DATE,MEAL_TYPE) values (72,to_date('25/11/07','RR/MM/DD'),'석식');
Insert into C##MEAL.MEALS (MEAL_ID,SERVED_DATE,MEAL_TYPE) values (70,to_date('25/11/07','RR/MM/DD'),'조식');
Insert into C##MEAL.MEALS (MEAL_ID,SERVED_DATE,MEAL_TYPE) values (71,to_date('25/11/07','RR/MM/DD'),'중식');
Insert into C##MEAL.MEALS (MEAL_ID,SERVED_DATE,MEAL_TYPE) values (75,to_date('25/11/17','RR/MM/DD'),'석식');
Insert into C##MEAL.MEALS (MEAL_ID,SERVED_DATE,MEAL_TYPE) values (73,to_date('25/11/17','RR/MM/DD'),'조식');
Insert into C##MEAL.MEALS (MEAL_ID,SERVED_DATE,MEAL_TYPE) values (74,to_date('25/11/17','RR/MM/DD'),'중식');
Insert into C##MEAL.MEALS (MEAL_ID,SERVED_DATE,MEAL_TYPE) values (78,to_date('25/11/18','RR/MM/DD'),'석식');
Insert into C##MEAL.MEALS (MEAL_ID,SERVED_DATE,MEAL_TYPE) values (76,to_date('25/11/18','RR/MM/DD'),'조식');
Insert into C##MEAL.MEALS (MEAL_ID,SERVED_DATE,MEAL_TYPE) values (77,to_date('25/11/18','RR/MM/DD'),'중식');
Insert into C##MEAL.MEALS (MEAL_ID,SERVED_DATE,MEAL_TYPE) values (81,to_date('25/11/19','RR/MM/DD'),'석식');
Insert into C##MEAL.MEALS (MEAL_ID,SERVED_DATE,MEAL_TYPE) values (79,to_date('25/11/19','RR/MM/DD'),'조식');
Insert into C##MEAL.MEALS (MEAL_ID,SERVED_DATE,MEAL_TYPE) values (80,to_date('25/11/19','RR/MM/DD'),'중식');
Insert into C##MEAL.MEALS (MEAL_ID,SERVED_DATE,MEAL_TYPE) values (84,to_date('25/11/20','RR/MM/DD'),'석식');
Insert into C##MEAL.MEALS (MEAL_ID,SERVED_DATE,MEAL_TYPE) values (82,to_date('25/11/20','RR/MM/DD'),'조식');
Insert into C##MEAL.MEALS (MEAL_ID,SERVED_DATE,MEAL_TYPE) values (83,to_date('25/11/20','RR/MM/DD'),'중식');
Insert into C##MEAL.MEALS (MEAL_ID,SERVED_DATE,MEAL_TYPE) values (87,to_date('25/11/21','RR/MM/DD'),'석식');
Insert into C##MEAL.MEALS (MEAL_ID,SERVED_DATE,MEAL_TYPE) values (85,to_date('25/11/21','RR/MM/DD'),'조식');
Insert into C##MEAL.MEALS (MEAL_ID,SERVED_DATE,MEAL_TYPE) values (86,to_date('25/11/21','RR/MM/DD'),'중식');
Insert into C##MEAL.MEALS (MEAL_ID,SERVED_DATE,MEAL_TYPE) values (90,to_date('25/11/24','RR/MM/DD'),'석식');
Insert into C##MEAL.MEALS (MEAL_ID,SERVED_DATE,MEAL_TYPE) values (88,to_date('25/11/24','RR/MM/DD'),'조식');
Insert into C##MEAL.MEALS (MEAL_ID,SERVED_DATE,MEAL_TYPE) values (89,to_date('25/11/24','RR/MM/DD'),'중식');
Insert into C##MEAL.MEALS (MEAL_ID,SERVED_DATE,MEAL_TYPE) values (93,to_date('25/11/25','RR/MM/DD'),'석식');
Insert into C##MEAL.MEALS (MEAL_ID,SERVED_DATE,MEAL_TYPE) values (91,to_date('25/11/25','RR/MM/DD'),'조식');
Insert into C##MEAL.MEALS (MEAL_ID,SERVED_DATE,MEAL_TYPE) values (92,to_date('25/11/25','RR/MM/DD'),'중식');
Insert into C##MEAL.MEALS (MEAL_ID,SERVED_DATE,MEAL_TYPE) values (96,to_date('25/11/26','RR/MM/DD'),'석식');
Insert into C##MEAL.MEALS (MEAL_ID,SERVED_DATE,MEAL_TYPE) values (94,to_date('25/11/26','RR/MM/DD'),'조식');
Insert into C##MEAL.MEALS (MEAL_ID,SERVED_DATE,MEAL_TYPE) values (95,to_date('25/11/26','RR/MM/DD'),'중식');
Insert into C##MEAL.MEALS (MEAL_ID,SERVED_DATE,MEAL_TYPE) values (99,to_date('25/11/27','RR/MM/DD'),'석식');
Insert into C##MEAL.MEALS (MEAL_ID,SERVED_DATE,MEAL_TYPE) values (97,to_date('25/11/27','RR/MM/DD'),'조식');
Insert into C##MEAL.MEALS (MEAL_ID,SERVED_DATE,MEAL_TYPE) values (98,to_date('25/11/27','RR/MM/DD'),'중식');
Insert into C##MEAL.MEALS (MEAL_ID,SERVED_DATE,MEAL_TYPE) values (102,to_date('25/11/28','RR/MM/DD'),'석식');
Insert into C##MEAL.MEALS (MEAL_ID,SERVED_DATE,MEAL_TYPE) values (100,to_date('25/11/28','RR/MM/DD'),'조식');
Insert into C##MEAL.MEALS (MEAL_ID,SERVED_DATE,MEAL_TYPE) values (101,to_date('25/11/28','RR/MM/DD'),'중식');
Insert into C##MEAL.MEALS (MEAL_ID,SERVED_DATE,MEAL_TYPE) values (105,to_date('25/12/01','RR/MM/DD'),'석식');
Insert into C##MEAL.MEALS (MEAL_ID,SERVED_DATE,MEAL_TYPE) values (103,to_date('25/12/01','RR/MM/DD'),'조식');
Insert into C##MEAL.MEALS (MEAL_ID,SERVED_DATE,MEAL_TYPE) values (104,to_date('25/12/01','RR/MM/DD'),'중식');
Insert into C##MEAL.MEALS (MEAL_ID,SERVED_DATE,MEAL_TYPE) values (108,to_date('25/12/02','RR/MM/DD'),'석식');
Insert into C##MEAL.MEALS (MEAL_ID,SERVED_DATE,MEAL_TYPE) values (106,to_date('25/12/02','RR/MM/DD'),'조식');
Insert into C##MEAL.MEALS (MEAL_ID,SERVED_DATE,MEAL_TYPE) values (107,to_date('25/12/02','RR/MM/DD'),'중식');
Insert into C##MEAL.MEALS (MEAL_ID,SERVED_DATE,MEAL_TYPE) values (111,to_date('25/12/03','RR/MM/DD'),'석식');
Insert into C##MEAL.MEALS (MEAL_ID,SERVED_DATE,MEAL_TYPE) values (109,to_date('25/12/03','RR/MM/DD'),'조식');
Insert into C##MEAL.MEALS (MEAL_ID,SERVED_DATE,MEAL_TYPE) values (110,to_date('25/12/03','RR/MM/DD'),'중식');
Insert into C##MEAL.MEALS (MEAL_ID,SERVED_DATE,MEAL_TYPE) values (114,to_date('25/12/04','RR/MM/DD'),'석식');
Insert into C##MEAL.MEALS (MEAL_ID,SERVED_DATE,MEAL_TYPE) values (112,to_date('25/12/04','RR/MM/DD'),'조식');
Insert into C##MEAL.MEALS (MEAL_ID,SERVED_DATE,MEAL_TYPE) values (113,to_date('25/12/04','RR/MM/DD'),'중식');
Insert into C##MEAL.MEALS (MEAL_ID,SERVED_DATE,MEAL_TYPE) values (117,to_date('25/12/05','RR/MM/DD'),'석식');
Insert into C##MEAL.MEALS (MEAL_ID,SERVED_DATE,MEAL_TYPE) values (115,to_date('25/12/05','RR/MM/DD'),'조식');
Insert into C##MEAL.MEALS (MEAL_ID,SERVED_DATE,MEAL_TYPE) values (116,to_date('25/12/05','RR/MM/DD'),'중식');
Insert into C##MEAL.MEALS (MEAL_ID,SERVED_DATE,MEAL_TYPE) values (120,to_date('25/12/08','RR/MM/DD'),'석식');
Insert into C##MEAL.MEALS (MEAL_ID,SERVED_DATE,MEAL_TYPE) values (118,to_date('25/12/08','RR/MM/DD'),'조식');
Insert into C##MEAL.MEALS (MEAL_ID,SERVED_DATE,MEAL_TYPE) values (119,to_date('25/12/08','RR/MM/DD'),'중식');
Insert into C##MEAL.MEALS (MEAL_ID,SERVED_DATE,MEAL_TYPE) values (123,to_date('25/12/09','RR/MM/DD'),'석식');
Insert into C##MEAL.MEALS (MEAL_ID,SERVED_DATE,MEAL_TYPE) values (121,to_date('25/12/09','RR/MM/DD'),'조식');
Insert into C##MEAL.MEALS (MEAL_ID,SERVED_DATE,MEAL_TYPE) values (122,to_date('25/12/09','RR/MM/DD'),'중식');
Insert into C##MEAL.MEALS (MEAL_ID,SERVED_DATE,MEAL_TYPE) values (126,to_date('25/12/10','RR/MM/DD'),'석식');
Insert into C##MEAL.MEALS (MEAL_ID,SERVED_DATE,MEAL_TYPE) values (124,to_date('25/12/10','RR/MM/DD'),'조식');
Insert into C##MEAL.MEALS (MEAL_ID,SERVED_DATE,MEAL_TYPE) values (125,to_date('25/12/10','RR/MM/DD'),'중식');
Insert into C##MEAL.MEALS (MEAL_ID,SERVED_DATE,MEAL_TYPE) values (129,to_date('25/12/11','RR/MM/DD'),'석식');
Insert into C##MEAL.MEALS (MEAL_ID,SERVED_DATE,MEAL_TYPE) values (127,to_date('25/12/11','RR/MM/DD'),'조식');
Insert into C##MEAL.MEALS (MEAL_ID,SERVED_DATE,MEAL_TYPE) values (128,to_date('25/12/11','RR/MM/DD'),'중식');
Insert into C##MEAL.MEALS (MEAL_ID,SERVED_DATE,MEAL_TYPE) values (132,to_date('25/12/12','RR/MM/DD'),'석식');
Insert into C##MEAL.MEALS (MEAL_ID,SERVED_DATE,MEAL_TYPE) values (130,to_date('25/12/12','RR/MM/DD'),'조식');
Insert into C##MEAL.MEALS (MEAL_ID,SERVED_DATE,MEAL_TYPE) values (131,to_date('25/12/12','RR/MM/DD'),'중식');
Insert into C##MEAL.MEALS (MEAL_ID,SERVED_DATE,MEAL_TYPE) values (135,to_date('25/12/15','RR/MM/DD'),'석식');
Insert into C##MEAL.MEALS (MEAL_ID,SERVED_DATE,MEAL_TYPE) values (133,to_date('25/12/15','RR/MM/DD'),'조식');
Insert into C##MEAL.MEALS (MEAL_ID,SERVED_DATE,MEAL_TYPE) values (134,to_date('25/12/15','RR/MM/DD'),'중식');
Insert into C##MEAL.MEALS (MEAL_ID,SERVED_DATE,MEAL_TYPE) values (136,to_date('25/12/16','RR/MM/DD'),'중식');
Insert into C##MEAL.MEALS (MEAL_ID,SERVED_DATE,MEAL_TYPE) values (137,to_date('25/12/17','RR/MM/DD'),'중식');
Insert into C##MEAL.MEALS (MEAL_ID,SERVED_DATE,MEAL_TYPE) values (138,to_date('25/12/18','RR/MM/DD'),'중식');
Insert into C##MEAL.MEALS (MEAL_ID,SERVED_DATE,MEAL_TYPE) values (139,to_date('25/12/19','RR/MM/DD'),'중식');
REM INSERTING into C##MEAL.MEAL_FOODS
SET DEFINE OFF;
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (1,1);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (1,2);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (1,3);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (1,4);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (1,5);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (1,6);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (2,6);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (2,7);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (2,8);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (2,9);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (2,10);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (2,11);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (3,1);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (3,6);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (3,12);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (3,13);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (3,14);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (3,15);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (4,6);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (4,7);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (4,16);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (4,17);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (4,18);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (4,19);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (5,1);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (5,6);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (5,20);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (5,21);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (5,22);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (5,23);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (6,6);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (6,7);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (6,24);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (6,25);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (6,26);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (6,27);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (7,6);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (7,28);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (7,29);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (7,30);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (7,31);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (7,32);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (8,1);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (8,6);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (8,33);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (8,34);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (8,35);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (8,36);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (9,6);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (9,37);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (9,38);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (9,39);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (9,40);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (10,1);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (10,6);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (10,41);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (10,42);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (10,43);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (10,44);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (11,1);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (11,6);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (11,45);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (11,46);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (11,47);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (11,48);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (12,49);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (12,50);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (13,1);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (13,6);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (13,23);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (13,51);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (13,52);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (13,53);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (14,1);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (14,6);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (14,11);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (14,54);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (14,55);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (14,56);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (15,1);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (15,6);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (15,21);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (15,57);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (15,58);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (15,59);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (16,6);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (16,7);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (16,23);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (16,60);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (16,61);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (16,62);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (17,6);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (17,63);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (17,64);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (17,65);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (17,66);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (17,67);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (18,6);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (18,7);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (18,68);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (18,69);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (18,70);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (18,71);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (19,6);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (19,7);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (19,19);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (19,72);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (19,73);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (19,74);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (20,6);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (20,7);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (20,8);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (20,9);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (20,75);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (20,76);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (21,1);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (21,6);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (21,31);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (21,77);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (21,78);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (21,79);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (22,1);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (22,6);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (22,80);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (22,81);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (22,82);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (22,83);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (23,6);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (23,59);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (23,84);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (23,85);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (23,86);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (23,87);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (24,6);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (24,7);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (24,88);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (24,89);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (24,90);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (24,91);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (25,6);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (25,7);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (25,13);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (25,92);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (25,93);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (25,94);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (26,1);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (26,6);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (26,95);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (26,96);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (26,97);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (26,98);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (27,1);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (27,6);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (27,19);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (27,99);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (27,100);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (27,101);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (28,1);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (28,6);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (28,102);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (28,103);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (28,104);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (28,105);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (29,5);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (29,6);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (29,7);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (29,61);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (29,106);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (29,107);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (30,1);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (30,6);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (30,31);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (30,108);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (30,109);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (30,110);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (31,6);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (31,23);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (31,111);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (31,112);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (31,113);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (31,114);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (32,6);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (32,7);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (32,115);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (32,116);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (32,117);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (32,118);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (33,1);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (33,6);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (33,90);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (33,119);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (33,120);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (33,121);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (34,6);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (34,7);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (34,122);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (34,123);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (34,124);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (34,125);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (35,6);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (35,59);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (35,126);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (35,127);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (35,128);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (35,129);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (36,6);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (36,7);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (36,24);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (36,71);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (36,130);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (36,131);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (37,1);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (37,6);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (37,132);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (37,133);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (37,134);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (37,135);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (38,7);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (38,136);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (38,137);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (38,138);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (38,139);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (38,140);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (39,6);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (39,26);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (39,141);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (39,142);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (39,143);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (39,144);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (40,6);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (40,7);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (40,19);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (40,93);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (40,145);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (40,146);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (41,6);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (41,27);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (41,40);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (41,147);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (41,148);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (41,149);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (42,1);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (42,6);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (42,26);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (42,150);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (42,151);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (42,152);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (43,1);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (43,6);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (43,23);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (43,61);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (43,153);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (43,154);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (44,6);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (44,7);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (44,155);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (44,156);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (44,157);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (44,158);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (45,6);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (45,40);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (45,159);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (45,160);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (45,161);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (45,162);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (46,4);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (46,6);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (46,163);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (46,164);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (46,165);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (46,166);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (47,1);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (47,6);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (47,35);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (47,138);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (47,167);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (47,168);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (48,6);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (48,7);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (48,11);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (48,106);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (48,169);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (48,170);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (49,1);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (49,6);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (49,14);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (49,73);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (49,171);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (49,172);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (50,6);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (50,83);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (50,160);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (50,173);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (50,174);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (50,175);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (51,6);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (51,7);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (51,176);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (51,177);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (51,178);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (51,179);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (52,6);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (52,7);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (52,19);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (52,180);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (52,181);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (52,182);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (53,6);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (53,7);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (53,17);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (53,183);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (53,184);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (53,185);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (54,6);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (54,19);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (54,186);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (54,187);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (54,188);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (54,189);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (55,1);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (55,6);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (55,11);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (55,106);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (55,190);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (55,191);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (56,7);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (56,97);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (56,192);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (56,193);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (56,194);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (56,195);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (57,1);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (57,6);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (57,107);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (57,119);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (57,196);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (57,197);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (58,1);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (58,6);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (58,198);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (58,199);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (58,200);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (58,201);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (59,6);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (59,202);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (59,203);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (59,204);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (59,205);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (59,206);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (60,6);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (60,7);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (60,90);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (60,207);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (60,208);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (60,209);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (61,6);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (61,7);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (61,76);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (61,210);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (61,211);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (61,212);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (62,6);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (62,7);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (62,213);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (62,214);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (62,215);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (62,216);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (63,1);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (63,6);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (63,47);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (63,138);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (63,161);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (63,217);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (64,6);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (64,28);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (64,44);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (64,218);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (64,219);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (64,220);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (65,6);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (65,40);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (65,221);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (65,222);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (65,223);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (65,224);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (66,6);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (66,7);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (66,10);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (66,31);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (66,100);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (66,136);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (67,6);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (67,7);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (67,41);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (67,225);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (67,226);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (67,227);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (68,6);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (68,7);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (68,228);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (68,229);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (68,230);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (68,231);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (69,6);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (69,26);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (69,59);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (69,87);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (69,232);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (69,233);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (70,1);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (70,6);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (70,14);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (70,17);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (70,51);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (70,231);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (71,6);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (71,7);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (71,66);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (71,234);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (71,235);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (71,236);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (72,1);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (72,5);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (72,6);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (72,150);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (72,237);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (72,238);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (73,6);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (73,7);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (73,30);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (73,73);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (73,197);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (73,239);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (74,6);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (74,7);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (74,240);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (74,241);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (74,242);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (74,243);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (75,1);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (75,6);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (75,23);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (75,244);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (75,245);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (75,246);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (76,1);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (76,6);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (76,14);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (76,19);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (76,247);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (76,248);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (77,6);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (77,7);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (77,151);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (77,157);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (77,249);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (77,250);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (78,1);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (78,6);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (78,251);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (78,252);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (78,253);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (78,254);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (79,6);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (79,23);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (79,255);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (79,256);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (79,257);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (79,258);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (80,6);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (80,7);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (80,259);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (80,260);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (80,261);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (80,262);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (81,6);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (81,160);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (81,263);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (81,264);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (81,265);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (82,6);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (82,7);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (82,266);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (82,267);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (82,268);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (82,269);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (83,1);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (83,6);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (83,174);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (83,270);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (83,271);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (83,272);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (84,6);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (84,115);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (84,147);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (84,196);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (84,273);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (85,1);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (85,6);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (85,106);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (85,179);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (85,274);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (85,275);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (86,7);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (86,23);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (86,276);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (86,277);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (86,278);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (86,279);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (87,6);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (87,27);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (87,161);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (87,280);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (87,281);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (87,282);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (88,1);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (88,6);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (88,106);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (88,158);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (88,191);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (88,283);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (89,1);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (89,6);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (89,19);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (89,108);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (89,284);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (89,285);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (90,6);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (90,7);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (90,94);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (90,197);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (90,286);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (90,287);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (91,6);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (91,7);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (91,288);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (91,289);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (91,290);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (91,291);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (92,7);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (92,195);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (92,281);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (92,292);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (92,293);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (92,294);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (93,1);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (93,6);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (93,252);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (93,295);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (93,296);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (93,297);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (94,6);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (94,62);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (94,256);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (94,298);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (94,299);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (94,300);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (95,6);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (95,7);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (95,11);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (95,204);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (95,301);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (95,302);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (96,1);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (96,6);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (96,14);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (96,303);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (96,304);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (96,305);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (97,6);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (97,7);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (97,88);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (97,219);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (97,306);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (97,307);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (98,6);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (98,77);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (98,84);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (98,308);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (98,309);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (99,6);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (99,13);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (99,23);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (99,310);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (99,311);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (99,312);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (100,1);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (100,6);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (100,164);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (100,313);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (100,314);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (100,315);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (101,6);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (101,7);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (101,35);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (101,106);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (101,316);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (101,317);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (102,1);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (102,6);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (102,223);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (102,318);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (102,319);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (102,320);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (103,6);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (103,274);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (103,321);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (103,322);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (103,323);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (103,324);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (104,6);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (104,7);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (104,213);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (104,219);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (104,325);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (104,326);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (105,6);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (105,7);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (105,31);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (105,327);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (105,328);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (105,329);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (106,1);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (106,6);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (106,155);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (106,238);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (106,330);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (106,331);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (107,118);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (107,265);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (107,332);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (107,333);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (108,6);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (108,40);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (108,174);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (108,217);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (108,232);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (108,334);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (109,6);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (109,7);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (109,71);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (109,119);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (109,335);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (109,336);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (110,6);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (110,7);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (110,23);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (110,148);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (110,337);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (110,338);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (111,6);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (111,7);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (111,21);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (111,197);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (111,339);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (111,340);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (112,6);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (112,44);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (112,159);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (112,341);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (112,342);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (113,6);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (113,105);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (113,165);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (113,173);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (113,343);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (113,344);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (114,6);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (114,39);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (114,112);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (114,144);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (114,310);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (114,345);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (115,1);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (115,6);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (115,31);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (115,346);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (115,347);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (115,348);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (116,6);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (116,7);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (116,73);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (116,212);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (116,349);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (116,350);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (117,1);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (117,6);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (117,30);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (117,150);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (117,237);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (117,351);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (118,1);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (118,6);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (118,219);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (118,276);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (118,352);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (118,353);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (119,6);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (119,7);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (119,11);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (119,241);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (119,315);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (119,354);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (120,1);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (120,6);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (120,179);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (120,355);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (120,356);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (120,357);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (121,1);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (121,6);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (121,14);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (121,358);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (121,359);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (121,360);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (122,6);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (122,160);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (122,256);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (122,361);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (122,362);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (122,363);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (123,6);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (123,7);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (123,18);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (123,151);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (123,244);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (123,364);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (124,6);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (124,365);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (124,366);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (124,367);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (124,368);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (125,6);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (125,7);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (125,120);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (125,369);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (125,370);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (125,371);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (126,6);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (126,39);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (126,265);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (126,372);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (126,373);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (126,374);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (127,6);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (127,7);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (127,23);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (127,61);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (127,110);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (127,375);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (128,1);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (128,6);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (128,196);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (128,376);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (128,377);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (128,378);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (129,6);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (129,7);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (129,87);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (129,379);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (129,380);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (129,381);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (130,1);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (130,6);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (130,21);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (130,281);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (130,382);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (130,383);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (131,6);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (131,39);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (131,119);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (131,147);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (131,384);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (131,385);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (132,6);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (132,59);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (132,64);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (132,225);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (132,386);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (133,1);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (133,4);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (133,6);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (133,61);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (133,285);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (133,387);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (134,6);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (134,7);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (134,158);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (134,375);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (134,388);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (134,389);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (135,1);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (135,6);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (135,13);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (135,115);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (135,216);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (135,390);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (136,6);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (136,7);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (136,326);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (136,356);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (136,391);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (136,392);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (137,6);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (137,393);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (137,394);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (137,395);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (137,396);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (137,397);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (138,6);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (138,36);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (138,100);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (138,141);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (138,398);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (138,399);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (139,6);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (139,321);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (139,400);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (139,401);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (139,402);
Insert into C##MEAL.MEAL_FOODS (MEAL_ID,FOOD_ID) values (139,403);
REM INSERTING into C##MEAL.REVIEWS
SET DEFINE OFF;
Insert into C##MEAL.REVIEWS (REVIEW_ID,MEAL_ID,STUDENT_ID,RATING,REVIEW_COMMENT,CREATED_AT) values (10,118,'2501110203',8,'항상 아침이 맛있는 것 같아요. ',to_timestamp('25/12/15 20:26:22.359000000','RR/MM/DD HH24:MI:SSXFF'));
Insert into C##MEAL.REVIEWS (REVIEW_ID,MEAL_ID,STUDENT_ID,RATING,REVIEW_COMMENT,CREATED_AT) values (11,119,'2501110203',4,'이름은 멕시칸 샐러드인데 그냥 샐러드였어요...',to_timestamp('25/12/15 20:26:53.772000000','RR/MM/DD HH24:MI:SSXFF'));
Insert into C##MEAL.REVIEWS (REVIEW_ID,MEAL_ID,STUDENT_ID,RATING,REVIEW_COMMENT,CREATED_AT) values (12,133,'2501110199',7,'쌀밥 최고!',to_timestamp('25/12/15 21:00:19.933000000','RR/MM/DD HH24:MI:SSXFF'));
Insert into C##MEAL.REVIEWS (REVIEW_ID,MEAL_ID,STUDENT_ID,RATING,REVIEW_COMMENT,CREATED_AT) values (13,134,'2501110199',5,'김치 맛집',to_timestamp('25/12/15 21:00:31.303000000','RR/MM/DD HH24:MI:SSXFF'));
Insert into C##MEAL.REVIEWS (REVIEW_ID,MEAL_ID,STUDENT_ID,RATING,REVIEW_COMMENT,CREATED_AT) values (14,135,'2501110199',6,'메뉴 구성이 단순하지만 기본은 한다.',to_timestamp('25/12/15 21:00:39.109000000','RR/MM/DD HH24:MI:SSXFF'));
Insert into C##MEAL.REVIEWS (REVIEW_ID,MEAL_ID,STUDENT_ID,RATING,REVIEW_COMMENT,CREATED_AT) values (15,133,'2501110200',9,'1000원이라 너무 좋아요',to_timestamp('25/12/15 21:01:15.075000000','RR/MM/DD HH24:MI:SSXFF'));
Insert into C##MEAL.REVIEWS (REVIEW_ID,MEAL_ID,STUDENT_ID,RATING,REVIEW_COMMENT,CREATED_AT) values (16,134,'2501110200',6,'기대 안 했는데 생각보다 맛있어서 만족했다.',to_timestamp('25/12/15 21:01:23.207000000','RR/MM/DD HH24:MI:SSXFF'));
Insert into C##MEAL.REVIEWS (REVIEW_ID,MEAL_ID,STUDENT_ID,RATING,REVIEW_COMMENT,CREATED_AT) values (17,135,'2501110200',4,'전체적으로 무난한 한 끼였다.',to_timestamp('25/12/15 21:01:37.396000000','RR/MM/DD HH24:MI:SSXFF'));
Insert into C##MEAL.REVIEWS (REVIEW_ID,MEAL_ID,STUDENT_ID,RATING,REVIEW_COMMENT,CREATED_AT) values (18,133,'2501110204',4,'학식다운 맛이라 익숙하고 편했다.',to_timestamp('25/12/15 21:02:05.126000000','RR/MM/DD HH24:MI:SSXFF'));
Insert into C##MEAL.REVIEWS (REVIEW_ID,MEAL_ID,STUDENT_ID,RATING,REVIEW_COMMENT,CREATED_AT) values (19,134,'2501110204',7,'반찬 간의 밸런스가 잘 맞았다.',to_timestamp('25/12/15 21:02:14.954000000','RR/MM/DD HH24:MI:SSXFF'));
Insert into C##MEAL.REVIEWS (REVIEW_ID,MEAL_ID,STUDENT_ID,RATING,REVIEW_COMMENT,CREATED_AT) values (20,135,'2501110204',6,'기름지지 않아서 부담 없이 먹었다.',to_timestamp('25/12/15 21:02:25.439000000','RR/MM/DD HH24:MI:SSXFF'));
Insert into C##MEAL.REVIEWS (REVIEW_ID,MEAL_ID,STUDENT_ID,RATING,REVIEW_COMMENT,CREATED_AT) values (21,133,'2501110205',1,'해쉬브라운에서 이상한 냄새가 나요...',to_timestamp('25/12/15 21:02:57.647000000','RR/MM/DD HH24:MI:SSXFF'));
Insert into C##MEAL.REVIEWS (REVIEW_ID,MEAL_ID,STUDENT_ID,RATING,REVIEW_COMMENT,CREATED_AT) values (22,134,'2501110205',3,'미역국 너무 짰어요..',to_timestamp('25/12/15 21:03:13.487000000','RR/MM/DD HH24:MI:SSXFF'));
Insert into C##MEAL.REVIEWS (REVIEW_ID,MEAL_ID,STUDENT_ID,RATING,REVIEW_COMMENT,CREATED_AT) values (23,135,'2501110205',1,'감자튀김 너무 눅눅해요.',to_timestamp('25/12/15 21:03:21.772000000','RR/MM/DD HH24:MI:SSXFF'));
Insert into C##MEAL.REVIEWS (REVIEW_ID,MEAL_ID,STUDENT_ID,RATING,REVIEW_COMMENT,CREATED_AT) values (27,133,'2501110209',1,'ㅋㅋㅋㅋ',to_timestamp('25/12/15 21:05:06.486000000','RR/MM/DD HH24:MI:SSXFF'));
Insert into C##MEAL.REVIEWS (REVIEW_ID,MEAL_ID,STUDENT_ID,RATING,REVIEW_COMMENT,CREATED_AT) values (28,134,'2501110209',10,'단호박찜 왤케 맛있음?',to_timestamp('25/12/15 21:05:16.749000000','RR/MM/DD HH24:MI:SSXFF'));
Insert into C##MEAL.REVIEWS (REVIEW_ID,MEAL_ID,STUDENT_ID,RATING,REVIEW_COMMENT,CREATED_AT) values (29,135,'2501110209',6,'햄버거 같은 거 나오면 좋을듯',to_timestamp('25/12/15 21:05:28.860000000','RR/MM/DD HH24:MI:SSXFF'));
Insert into C##MEAL.REVIEWS (REVIEW_ID,MEAL_ID,STUDENT_ID,RATING,REVIEW_COMMENT,CREATED_AT) values (30,133,'2501110210',10,'오늘 식단 구성 굉장히 좋네요',to_timestamp('25/12/15 21:06:08.417000000','RR/MM/DD HH24:MI:SSXFF'));
Insert into C##MEAL.REVIEWS (REVIEW_ID,MEAL_ID,STUDENT_ID,RATING,REVIEW_COMMENT,CREATED_AT) values (31,134,'2501110210',2,'12시 40분에 갔는데 떡갈비 다떨어져서 김이랑 먹었어요...',to_timestamp('25/12/15 21:06:37.256000000','RR/MM/DD HH24:MI:SSXFF'));
Insert into C##MEAL.REVIEWS (REVIEW_ID,MEAL_ID,STUDENT_ID,RATING,REVIEW_COMMENT,CREATED_AT) values (32,135,'2501110210',3,'감자튀김 눅눅해요',to_timestamp('25/12/15 21:06:46.253000000','RR/MM/DD HH24:MI:SSXFF'));
Insert into C##MEAL.REVIEWS (REVIEW_ID,MEAL_ID,STUDENT_ID,RATING,REVIEW_COMMENT,CREATED_AT) values (33,133,'2501110203',8,'해쉬브라운 맛있었어요ㅎㅎ',to_timestamp('25/12/15 21:37:41.959000000','RR/MM/DD HH24:MI:SSXFF'));
Insert into C##MEAL.REVIEWS (REVIEW_ID,MEAL_ID,STUDENT_ID,RATING,REVIEW_COMMENT,CREATED_AT) values (26,135,'2501110206',7,'닭갈비 최고',to_timestamp('25/12/15 21:04:04.930000000','RR/MM/DD HH24:MI:SSXFF'));
Insert into C##MEAL.REVIEWS (REVIEW_ID,MEAL_ID,STUDENT_ID,RATING,REVIEW_COMMENT,CREATED_AT) values (24,133,'2501110206',3,'콩조림이 왜 짜죠?',to_timestamp('25/12/15 21:03:47.104000000','RR/MM/DD HH24:MI:SSXFF'));
Insert into C##MEAL.REVIEWS (REVIEW_ID,MEAL_ID,STUDENT_ID,RATING,REVIEW_COMMENT,CREATED_AT) values (25,134,'2501110206',10,'떡갈비 맛있었어요!',to_timestamp('25/12/15 21:03:56.966000000','RR/MM/DD HH24:MI:SSXFF'));
Insert into C##MEAL.REVIEWS (REVIEW_ID,MEAL_ID,STUDENT_ID,RATING,REVIEW_COMMENT,CREATED_AT) values (9,119,'2501110204',3,'별로였음...',to_timestamp('25/12/08 00:00:00.000000000','RR/MM/DD HH24:MI:SSXFF'));
REM INSERTING into C##MEAL.STUDENTS
SET DEFINE OFF;
Insert into C##MEAL.STUDENTS (STUDENT_ID,NAME,GENDER,BIRTH_DATE) values ('2501110199','김예진','F',to_date('03/10/09','RR/MM/DD'));
Insert into C##MEAL.STUDENTS (STUDENT_ID,NAME,GENDER,BIRTH_DATE) values ('2501110200','김재영','M',to_date('99/01/20','RR/MM/DD'));
Insert into C##MEAL.STUDENTS (STUDENT_ID,NAME,GENDER,BIRTH_DATE) values ('2501110202','김해민','F',to_date('01/05/07','RR/MM/DD'));
Insert into C##MEAL.STUDENTS (STUDENT_ID,NAME,GENDER,BIRTH_DATE) values ('2501110203','김호석','M',to_date('98/02/22','RR/MM/DD'));
Insert into C##MEAL.STUDENTS (STUDENT_ID,NAME,GENDER,BIRTH_DATE) values ('2501110204','도경진','M',to_date('03/05/01','RR/MM/DD'));
Insert into C##MEAL.STUDENTS (STUDENT_ID,NAME,GENDER,BIRTH_DATE) values ('2501110205','박경구','M',to_date('95/01/01','RR/MM/DD'));
Insert into C##MEAL.STUDENTS (STUDENT_ID,NAME,GENDER,BIRTH_DATE) values ('2501110206','박성준','M',to_date('05/03/10','RR/MM/DD'));
Insert into C##MEAL.STUDENTS (STUDENT_ID,NAME,GENDER,BIRTH_DATE) values ('2501110209','박준범','M',to_date('01/07/11','RR/MM/DD'));
Insert into C##MEAL.STUDENTS (STUDENT_ID,NAME,GENDER,BIRTH_DATE) values ('2501110210','박찬웅','M',to_date('02/08/28','RR/MM/DD'));
Insert into C##MEAL.STUDENTS (STUDENT_ID,NAME,GENDER,BIRTH_DATE) values ('2501110213','신동경','M',to_date('01/10/10','RR/MM/DD'));
Insert into C##MEAL.STUDENTS (STUDENT_ID,NAME,GENDER,BIRTH_DATE) values ('2501110215','유상훈','M',to_date('05/11/11','RR/MM/DD'));
--------------------------------------------------------
--  DDL for Index SYS_C008606
--------------------------------------------------------

  CREATE UNIQUE INDEX "C##MEAL"."SYS_C008606" ON "C##MEAL"."ACCOUNTS" ("STUDENT_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index SYS_C008582
--------------------------------------------------------

  CREATE UNIQUE INDEX "C##MEAL"."SYS_C008582" ON "C##MEAL"."FOODS" ("FOOD_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index SYS_C008583
--------------------------------------------------------

  CREATE UNIQUE INDEX "C##MEAL"."SYS_C008583" ON "C##MEAL"."FOODS" ("NAME") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index SYS_C008578
--------------------------------------------------------

  CREATE UNIQUE INDEX "C##MEAL"."SYS_C008578" ON "C##MEAL"."MEALS" ("MEAL_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index SYS_C008579
--------------------------------------------------------

  CREATE UNIQUE INDEX "C##MEAL"."SYS_C008579" ON "C##MEAL"."MEALS" ("SERVED_DATE", "MEAL_TYPE") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index SYS_C008586
--------------------------------------------------------

  CREATE UNIQUE INDEX "C##MEAL"."SYS_C008586" ON "C##MEAL"."MEAL_FOODS" ("MEAL_ID", "FOOD_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index SYS_C008612
--------------------------------------------------------

  CREATE UNIQUE INDEX "C##MEAL"."SYS_C008612" ON "C##MEAL"."REVIEWS" ("REVIEW_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index SYS_C008613
--------------------------------------------------------

  CREATE UNIQUE INDEX "C##MEAL"."SYS_C008613" ON "C##MEAL"."REVIEWS" ("MEAL_ID", "STUDENT_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index SYS_C008444
--------------------------------------------------------

  CREATE UNIQUE INDEX "C##MEAL"."SYS_C008444" ON "C##MEAL"."STUDENTS" ("STUDENT_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  Constraints for Table ACCOUNTS
--------------------------------------------------------

  ALTER TABLE "C##MEAL"."ACCOUNTS" MODIFY ("STUDENT_ID" NOT NULL ENABLE);
  ALTER TABLE "C##MEAL"."ACCOUNTS" MODIFY ("PASSWORD_HASH" NOT NULL ENABLE);
  ALTER TABLE "C##MEAL"."ACCOUNTS" MODIFY ("CREATED_AT" NOT NULL ENABLE);
  ALTER TABLE "C##MEAL"."ACCOUNTS" ADD PRIMARY KEY ("STUDENT_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table FOODS
--------------------------------------------------------

  ALTER TABLE "C##MEAL"."FOODS" MODIFY ("FOOD_ID" NOT NULL ENABLE);
  ALTER TABLE "C##MEAL"."FOODS" MODIFY ("NAME" NOT NULL ENABLE);
  ALTER TABLE "C##MEAL"."FOODS" ADD PRIMARY KEY ("FOOD_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "C##MEAL"."FOODS" ADD UNIQUE ("NAME")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table MEALS
--------------------------------------------------------

  ALTER TABLE "C##MEAL"."MEALS" MODIFY ("MEAL_ID" NOT NULL ENABLE);
  ALTER TABLE "C##MEAL"."MEALS" MODIFY ("SERVED_DATE" NOT NULL ENABLE);
  ALTER TABLE "C##MEAL"."MEALS" MODIFY ("MEAL_TYPE" NOT NULL ENABLE);
  ALTER TABLE "C##MEAL"."MEALS" ADD CONSTRAINT "CHECK_TYPE" CHECK (meal_type in ('조식', '중식', '석식')) ENABLE;
  ALTER TABLE "C##MEAL"."MEALS" ADD PRIMARY KEY ("MEAL_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "C##MEAL"."MEALS" ADD UNIQUE ("SERVED_DATE", "MEAL_TYPE")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table MEAL_FOODS
--------------------------------------------------------

  ALTER TABLE "C##MEAL"."MEAL_FOODS" MODIFY ("MEAL_ID" NOT NULL ENABLE);
  ALTER TABLE "C##MEAL"."MEAL_FOODS" MODIFY ("FOOD_ID" NOT NULL ENABLE);
  ALTER TABLE "C##MEAL"."MEAL_FOODS" ADD PRIMARY KEY ("MEAL_ID", "FOOD_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table REVIEWS
--------------------------------------------------------

  ALTER TABLE "C##MEAL"."REVIEWS" MODIFY ("REVIEW_ID" NOT NULL ENABLE);
  ALTER TABLE "C##MEAL"."REVIEWS" MODIFY ("RATING" NOT NULL ENABLE);
  ALTER TABLE "C##MEAL"."REVIEWS" MODIFY ("CREATED_AT" NOT NULL ENABLE);
  ALTER TABLE "C##MEAL"."REVIEWS" ADD CONSTRAINT "CHECK_RATING" CHECK (rating BETWEEN 1 AND 10) ENABLE;
  ALTER TABLE "C##MEAL"."REVIEWS" ADD PRIMARY KEY ("REVIEW_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "C##MEAL"."REVIEWS" ADD UNIQUE ("MEAL_ID", "STUDENT_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table STUDENTS
--------------------------------------------------------

  ALTER TABLE "C##MEAL"."STUDENTS" MODIFY ("STUDENT_ID" NOT NULL ENABLE);
  ALTER TABLE "C##MEAL"."STUDENTS" MODIFY ("NAME" NOT NULL ENABLE);
  ALTER TABLE "C##MEAL"."STUDENTS" ADD CONSTRAINT "CHECK_GENDER" CHECK (gender IN ('F', 'M') OR gender IS NULL) ENABLE;
  ALTER TABLE "C##MEAL"."STUDENTS" ADD PRIMARY KEY ("STUDENT_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table ACCOUNTS
--------------------------------------------------------

  ALTER TABLE "C##MEAL"."ACCOUNTS" ADD FOREIGN KEY ("STUDENT_ID")
	  REFERENCES "C##MEAL"."STUDENTS" ("STUDENT_ID") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table MEAL_FOODS
--------------------------------------------------------

  ALTER TABLE "C##MEAL"."MEAL_FOODS" ADD FOREIGN KEY ("MEAL_ID")
	  REFERENCES "C##MEAL"."MEALS" ("MEAL_ID") ON DELETE CASCADE ENABLE;
  ALTER TABLE "C##MEAL"."MEAL_FOODS" ADD FOREIGN KEY ("FOOD_ID")
	  REFERENCES "C##MEAL"."FOODS" ("FOOD_ID") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table REVIEWS
--------------------------------------------------------

  ALTER TABLE "C##MEAL"."REVIEWS" ADD FOREIGN KEY ("MEAL_ID")
	  REFERENCES "C##MEAL"."MEALS" ("MEAL_ID") ON DELETE SET NULL ENABLE;
  ALTER TABLE "C##MEAL"."REVIEWS" ADD FOREIGN KEY ("STUDENT_ID")
	  REFERENCES "C##MEAL"."STUDENTS" ("STUDENT_ID") ON DELETE SET NULL ENABLE;
