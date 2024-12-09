<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>AI Choice</title>
    <link rel="stylesheet" href="../css/styles.css">
    <link rel="stylesheet" href="../css/AI_choice.css">
    <link rel="stylesheet" href="../css/navbar.css">
    <link rel="stylesheet" href="../css/login.css">
    <link rel="stylesheet" href="../css/footer.css">

    

</head>
<body>
    <!-- Header/Navbar -->
    <header class="navbar">
        <div class="navbar-left">
            <button class="menu-icon">☰</button>
            <div class="logo">AI Steam Guide</div>
        </div>
        <div class="navbar-center">
            <div class="search-container">
                <input type="text" placeholder="Search" class="search-bar">
                <button class="search-btn">
                    <img src="../images/search-icon.png" alt="Search Icon" class="search-icon">
                </button>
            </div>
        </div>
        <div class="navbar-right">
            <button class="bookmark" onclick="location.href='../pages/bookmark.jsp'">
                <img src="../images/bookmark.png" alt="bookmark" class="bookmark-img">
            </button>
            <button class="icon">
                <img src="../images/notification-icon.png" alt="Notification Icon" class="icon-img">
            </button>
            <button class="login-btn">로그인/회원가입</button>
        </div>
    </header>

    <!-- Navigation Menu -->
    <nav class="secondary-menu">
        <ul>
            <li><a href="../pages/community.jsp">Coummnity</a></li> 
            <li><a href="../pages/AI_choice.jsp">AI_choice</a></li> 
            <li><a href="../pages/sale.jsp">Sale games</a></li> 
            <li><a href="../pages/library.jsp">Library</a></li>
        </ul>
    </nav>

    <!-- Main Content -->
    <main>
        <!-- Hero Section -->
        <section class="hero">
            <h1>AI Choice</h1>
            <p>
                AI가 당신의 Steam 라이브러리에 있는 게임들을 분석해<br>
                당신에게 맞는 게임을 추천해드립니다
            </p>
            <button class="analyze-btn">분석하기</button>
            <p class="info-text">
                *라이브러리의 게임이 연동되어 있지 않거나 확인되지 않으면, 연동하여야 정확한 분석이 가능합니다.
            </p>
        </section>

        <!-- Examples Section -->
        <section class="examples">
            <h2>예시</h2>
            <div class="example-steps">
                <div class="step">
                    <h3>1. 라이브러리의 스팀게임 연동 확인</h3>
                    <img src="../images/example1.png" alt="Example 1">
                </div>
                <div class="step">
                    <h3>2. 분석 로딩중</h3>
                    <img src="../images/example2.png" alt="Example 2">
                </div>
                <div class="step">
                    <h3>3. 분석된 게임 추천</h3>
                    <img src="../images/example3.png" alt="Example 3">
                </div>
            </div>
        </section>
    </main>

    <!-- Footer -->


    <div id="footer"></div>
    <style>
        .logo {
            cursor: pointer; /* 클릭 가능한 손 모양 커서를 표시 */
        }
    </style>

    <script>
        // footer.html 파일을 동적으로 로드
        fetch('../pages/footer.jsp')
            .then(response => response.text())
            .then(data => {
                document.getElementById('footer').innerHTML = data;
            });
    
        // 로그인/회원가입 버튼 클릭 시 페이지 이동
        document.addEventListener('DOMContentLoaded', () => {
            const loginButton = document.querySelector('.login-btn');
            if (loginButton) {
                loginButton.addEventListener('click', () => {
                    window.location.href = '../pages/login.jsp'; // 로그인 페이지로 이동
                });
            }
        });
        document.addEventListener('DOMContentLoaded', () => {
            const mainLink = document.querySelector('.logo'); // 텍스트를 감싼 클래스 선택
            if (mainLink) {
                mainLink.addEventListener('click', () => {
                    window.location.href = '../pages/main.jsp'; // 메인 페이지로 이동
                });
            }
        });
    </script>
</body>
</html>
