<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.*, java.net.*, org.json.simple.*, org.json.simple.parser.*" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>AI Steam Guide - 알림 페이지</title>
    <link rel="stylesheet" href="../css/styles.css">
    <link rel="stylesheet" href="../css/navbar.css">
    <link rel="stylesheet" href="../css/footer.css">
    <link rel="stylesheet" href="../css/alert.css">
</head>
<body>
    <!-- Header/Navbar -->
    <header class="navbar">
        <div class="navbar-left">
            <button class="menu-icon">☰</button>
            <div class="logo" onclick="location.href='../pages/main.jsp';">AI Steam Guide</div>
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
            <button class="icon" onclick="location.href='../pages/alert.jsp'">
                <img src="../images/notification-icon.png" alt="Notification Icon" class="icon-img">
            </button>               
            
            <%-- 로그인 상태에 따라 버튼 다르게 표시 --%>
            <%
                String username = (String) session.getAttribute("username");
                if (username != null) {
            %>
            <a href="../pages/profile.jsp" class="profile-name">안녕하세요, <%= username %></a>
            <form action="../pages/logout.jsp" method="post" style="display:inline;">
                <button type="submit" class="logout-btn">로그아웃</button>
            </form>
            <% } else { %>
            <button class="login-btn" onclick="window.location.href='../pages/login.jsp';">로그인/회원가입</button>
            <% } %>
        </div>
    </header>

    <nav class="secondary-menu">
        <ul>
            <li><a href="../pages/community.jsp">Community</a></li>
            <li><a href="../pages/AI_choice.jsp">AI_choice</a></li>
            <li><a href="../pages/sale.jsp">Sale games</a></li>
            <li><a href="../pages/library.jsp">Library</a></li>
        </ul>
    </nav>

    <main>
        <section class="alert-section">
            <h1>AI STEAM GUIDE의 업데이트 공지 사항</h1>
            <p>UI 개선, 스팀게임 추가 등 다양한 업데이트를 여기서 확인할 수 있습니다!</p>
            <ul class="alert-list">
                <li>12.12 AI STEAM GUIDE 웹페이지가 출시되었습니다!</li>
                <li>12.10 UI 개선 및 버전 업데이트 진행하였습니다!</li>
                <li>12.08 AI STEAM GUIDE 웹페이지가 출시되었습니다!</li>
                <li>12.05 기능 개선 업데이트가 적용되었습니다!</li>
                <li>12.03 새로운 게임 추천 기능이 추가되었습니다!</li>
            </ul>
        </section>
    </main>

    <div id="footer"></div>

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
    </script>
</body>
</html>
