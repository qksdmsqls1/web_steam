<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>AI Choice 분석 성공 - AI Steam Guide</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/styles.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/navbar.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/footer.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/AI_choice_ok.css">
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

    <nav class="secondary-menu">
        <ul>
            <li><a href="<%= request.getContextPath() %>/pages/community.jsp">Community</a></li> 
            <li><a href="<%= request.getContextPath() %>/pages/AI_choice.jsp">AI_choice</a></li> 
            <li><a href="<%= request.getContextPath() %>/pages/sale.jsp">Sale games</a></li> 
            <li><a href="<%= request.getContextPath() %>/pages/library.jsp">Library</a></li>
        </ul>
    </nav>

    <main>
        <section class="ai-choice-success">
            <h1>AI 추천 분석이 성공적으로 완료되었습니다!</h1>
            <p>분석 결과를 확인하려면 아래 버튼을 클릭하세요.</p>
            <button class="result-redirect-btn" onclick="location.href='<%= request.getContextPath() %>/pages/AI_choice_results.jsp'">결과 보기</button>
        </section>
    </main>

    <div id="footer"></div>

    <script>
        // footer.jsp 파일을 동적으로 로드
        fetch('<%= request.getContextPath() %>/pages/footer.jsp')
            .then(response => response.text())
            .then(data => {
                document.getElementById('footer').innerHTML = data;
            });
    </script>
</body>
</html>
