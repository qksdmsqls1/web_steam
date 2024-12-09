<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.*, java.net.*, org.json.simple.*, org.json.simple.parser.*" %>
<%@ page import="java.sql.*, javax.sql.*, java.io.*, java.net.*" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>AI Steam Guide</title>
    <link rel="stylesheet" href="../css/styles.css">
    <link rel="stylesheet" href="../css/navbar.css">
    <link rel="stylesheet" href="../css/login.css">
    <link rel="stylesheet" href="../css/footer.css">
    <link rel="stylesheet" href="../css/librarywin.css">
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
            <%
                String username = (String) session.getAttribute("username");
                if (username != null) {
            %>
            <!-- 로그인한 경우 -->
            <a href="../pages/profile.jsp" class="profile-name">안녕하세요, <%= username %></a>
            <form action="../pages/logout.jsp" method="post" style="display: inline;">
                <button type="submit" class="logout-btn">로그아웃</button>
            </form>
            <%
                } else {
            %>
            <!-- 로그인하지 않은 경우 -->
            <button class="login-btn" onclick="window.location.href='../pages/login.jsp';">로그인/회원가입</button>
            <%
                }
            %>
        </div>
    </header>
    
    <nav class="secondary-menu">
        <ul>
            <li><a href="../pages/coummnity.jsp">Community</a></li> 
            <li><a href="../pages/AI_choice.jsp">AI_choice</a></li> 
            <li><a href="../pages/sale.jsp">Sale games</a></li> 
            <li><a href="../pages/library.jsp">Library</a></li>
        </ul>
    </nav>

    <main>
        <section class="library-container">
            <!-- 프로필과 설명 -->
            <div class="library-header">
                <img src="../images/game.png" alt="프로필 이미지" class="profile-img">
                <div class="library-info">
    					<h3><%= username %>님의 라이브러리</h3>
                    <div class="card">
                        <p>Steam 계정이 없으신가요? <br>ASG 회원가입을 통해 게임들을 둘러보세요!</p>
                    </div>
                </div>
                <div class="library-status">
                    <span>Steam 라이브러리 연동 실패</span>
                </div>
            </div>
            
            <!-- 중앙 메시지 -->
            <div class="library-content">
                <h1>nothing</h1>
                <p>라이브러리 불러오기에 실패했습니다</p>
                <button class="login-btn-large" onclick="location.href='login.jsp'">로그인/회원가입</button>
            </div>
        </section>
            

    </main>
    </body>


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
    
    </html>
