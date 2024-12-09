<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>AI Steam Guide - 프로필 수정</title>
    <link rel="stylesheet" href="../css/styles.css">
    <link rel="stylesheet" href="../css/navbar.css"> 
    <link rel="stylesheet" href="../css/profile.css">
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
            <button class="bookmark">
                <img src="../images/bookmark.png" alt="bookmark" class="bookmark-img">
            </button>
            <button class="icon">
                <img src="../images/notification-icon.png" alt="Notification Icon" class="icon-img">
            </button>
            <button class="login-btn">로그인/회원가입</button>
        </div>
    </header>
    
    <nav class="secondary-menu">
        <ul>
            <li><a href="#">Community</a></li>
            <li><a href="#">AI_choice</a></li>
            <li><a href="#">Sale games</a></li>
            <li><a href="#">Library</a></li>
        </ul>
    </nav>

    <!-- Main Content -->
    <main class="content-container">
        <section class="profile-edit">
            <h2>프로필 수정</h2>
            <form class="signup-form" method="post" action="<%= request.getContextPath() %>/pages/profile_update.jsp">
                <div class="form-group">
                    <label for="profileImage">프로필 사진</label>
                    <input type="file" id="profileImage" name="profileImage" accept="image/*">
                </div>
                <div class="form-group">
                    <label for="userName">이름</label>
                    <input type="text" id="userName" name="userName" value="<%= session.getAttribute("username") %>" required>
                </div>
                <div class="form-group">
                    <label for="steamId">SteamID</label>
                    <input type="text" id="steamId" name="steamId" value="" required>
                </div>
                <button type="submit" class="save-btn">수정 내용 저장</button>
            </form>
        </section>
    </main>

    <!-- Footer -->
    <footer class="footer-container">
        <div class="footer-content">
            <div class="footer-left">
                <h4>스팀 추천 웹 사이트 제작자</h4>
                <ul>
                    <li>노현수 20223231</li>
                    <li>최동혁 20223123</li>
                    <li>황은빈 20224256</li>
                    <li>김기호 20224297</li>
                </ul>
            </div>
            <div class="footer-right">
                <h4>서포트 · 보러가기</h4>
                <ul>
                    <li>후원</li>
                    <li>쿠키 · cookie</li>
                    <li><a href="https://www.steam.com" target="_blank">오픈소스 - www.steam.com</a></li>
                    <li><a href="https://api.steampowered.com" target="_blank">API</a></li>
                </ul>
            </div>
        </div>
    </footer>

    <script>
        // Footer Dynamic Loading
        fetch('../pages/footer.jsp')
            .then(response => response.text())
            .then(data => {
                document.querySelector('.footer-container').innerHTML = data;
            });

        // Redirect to Main Page when Logo is Clicked
        document.addEventListener('DOMContentLoaded', () => {
            const mainLogo = document.querySelector('.logo');
            if (mainLogo) {
                mainLogo.addEventListener('click', () => {
                    window.location.href = '../pages/main.jsp';
                });
            }
        });
    </script>
</body>
</html>
