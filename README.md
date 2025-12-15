# 🍽️ 학식 평가 프로그램

<img src="https://github.com/user-attachments/assets/sample-image-placeholder" width="500">

### ⚠️ 본 프로젝트는 Java JFrame 기반 데스크톱 애플리케이션으로, 학습 목적의 과제 프로젝트입니다.
<br>

### "오늘 학식, 먹을 만할까?"
대학생이라면 누구나 한 번쯤 해봤을 고민입니다.  
이 프로그램은 학식 메뉴를 조회하고, 실제 이용자들의 리뷰와 평점을 통해  
메뉴 선택에 도움을 주기 위해 제작된 **학식 평가 및 리뷰 프로그램**입니다.

사용자는 학식 메뉴를 날짜별로 확인하고,  
직접 리뷰를 작성·수정·열람하며 학식 이용 경험을 공유할 수 있습니다.

##### 제작날짜 2025.12

<br>

## 📌 프로젝트 개요

- **플랫폼:** Desktop Application (Java Swing)  
- **아키텍처:** MVC 패턴  
- **데이터베이스:** RDBMS (JDBC 연동)

- **주요 기능:**
  - 🔐 `로그인 / 회원가입` : 사용자 인증 및 계정 관리
  - 📅 `금일 메뉴 조회` : 오늘 제공되는 학식 메뉴 확인
  - 📆 `금주 메뉴 조회` : 한 주간의 학식 메뉴 미리보기
  - ✍️ `리뷰 작성` : 메뉴에 대한 리뷰 및 평점 등록
  - ✏️ `리뷰 수정` : 기존 리뷰 수정
  - 👀 `리뷰 열람` : 메뉴별 전체 리뷰 조회

<br>

## 📷 상세 화면
|Description|Image|
|:--:|:--:|
|로그인 화면|<img src="https://github.com/user-attachments/assets/sample-login" width="500">|
|금일 메뉴|<img src="https://github.com/user-attachments/assets/sample-today" width="500">|
|금주 메뉴|<img src="https://github.com/user-attachments/assets/sample-week" width="500">|
|리뷰 작성|<img src="https://github.com/user-attachments/assets/sample-review" width="500">|
|리뷰 열람|<img src="https://github.com/user-attachments/assets/sample-review-tab" width="500">|

<br>

## 🗂️ 프로젝트 구조
📁 JavaTermProject/  
├── 📁 MealReview/  
│ └── 📁 src/  
│   ├── 📁 controller/  
│   ├── 📁 domain/  
│   ├── 📁 repository/  
│   └── 📁 view/  
├── 2501110203_김호석_보고서.pdf  
├── Database.sql  
└── README.md  

<br>

## 🔍 실행 방법

1. Database.sql 파일을 실행하여 데이터베이스 생성 및 테이블 초기화
2. JDBC 연결 정보 설정
3. `MainController.java` 실행

<br>

## 🌱 향후 개선 사항

- UI 디자인 개선
- 검색 및 필터 기능 추가
- 관리자 전용 메뉴 관리 기능 구현

<br>

## 📃 라이선스

본 프로젝트는 학습 및 개인 포트폴리오 용도로 자유롭게 수정 및 재배포가 가능합니다.
