<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>AI Choice</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/styles.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/AI_choice.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/navbar.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/login.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/footer.css">
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
                    <img src="<%= request.getContextPath() %>/images/search-icon.png" alt="Search Icon" class="search-icon">
                </button>
            </div>
        </div>
        <div class="navbar-right">
            <button class="bookmark" onclick="location.href='<%= request.getContextPath() %>/pages/bookmark.jsp'">
                <img src="<%= request.getContextPath() %>/images/bookmark.png" alt="bookmark" class="bookmark-img">
            </button>
            <button class="icon" onclick="location.href='<%= request.getContextPath() %>/pages/alert.jsp'">
                <img src="<%= request.getContextPath() %>/images/notification-icon.png" alt="Notification Icon" class="icon-img">
            </button>    
            <button class="login-btn">로그인/회원가입</button>
        </div>
    </header>

    <!-- Navigation Menu -->
    <nav class="secondary-menu">
        <ul>
            <li><a href="<%= request.getContextPath() %>/pages/community.jsp">Community</a></li>
            <li><a href="<%= request.getContextPath() %>/pages/AI_choice.jsp">AI_choice</a></li>
            <li><a href="<%= request.getContextPath() %>/pages/sale.jsp">Sale games</a></li>
            <li><a href="<%= request.getContextPath() %>/pages/library.jsp">Library</a></li>
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
            <button class="analyze-btn" id="analyze-btn">분석하기</button>
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
                    <img src="<%= request.getContextPath() %>/images/example1.png" alt="Example 1">
                </div>
                <div class="step">
                    <h3>2. 분석 로딩중</h3>
                    <img src="<%= request.getContextPath() %>/images/example2.png" alt="Example 2">
                </div>
                <div class="step">
                    <h3>3. 분석된 게임 추천</h3>
                    <img src="<%= request.getContextPath() %>/images/example3.png" alt="Example 3">
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
        // footer.jsp 파일을 동적으로 로드
        fetch('<%= request.getContextPath() %>/pages/footer.jsp')
            .then(response => response.text())
            .then(data => {
                document.getElementById('footer').innerHTML = data;
            });

        // 로그인/회원가입 버튼 클릭 시 페이지 이동
        document.addEventListener('DOMContentLoaded', () => {
            const loginButton = document.querySelector('.login-btn');
            if (loginButton) {
                loginButton.addEventListener('click', () => {
                    window.location.href = '<%= request.getContextPath() %>/pages/login.jsp'; // 로그인 페이지로 이동
                });
            }
        });

        // 메인 로고 클릭 시 페이지 이동
        document.addEventListener('DOMContentLoaded', () => {
            const mainLink = document.querySelector('.logo'); // 텍스트를 감싼 클래스 선택
            if (mainLink) {
                mainLink.addEventListener('click', () => {
                    window.location.href = '<%= request.getContextPath() %>/pages/main.jsp'; // 메인 페이지로 이동
                });
            }
        });

        // 분석 버튼 클릭 시 라이브러리 확인
        document.getElementById("analyze-btn").addEventListener("click", function() {
            // AJAX 요청을 통해 라이브러리 확인
            fetch('<%= request.getContextPath() %>/checkLibrary.jsp')  // 라이브러리 확인 페이지로 요청
                .then(response => response.json())
                .then(data => {
                    if (!data.libraryLinked) {
                        // 라이브러리가 없으면 실패 페이지로 리다이렉트
                        window.location.href = '<%= request.getContextPath() %>/fail.jsp';
                    } else {
                        // 라이브러리가 있으면 분석 페이지로 이동
                        window.location.href = '<%= request.getContextPath() %>/AI_choice_ok.jsp';
                    }
                })
                .catch(error => {
                    console.error('Error:', error);
                    // 오류 발생 시 실패 페이지로 리다이렉트
                    window.location.href = '<%= request.getContextPath() %>/fail.jsp';
                });
        });
    </script>
</body>
</html>
