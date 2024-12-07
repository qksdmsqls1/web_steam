<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원가입 성공 - AI Steam Guide</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/styles.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/navbar.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/footer.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/signup_ok.css">
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
            <button class="bookmark" onclick="location.href='<%= request.getContextPath() %>/pages/bookmark.html'">
                <img src="<%= request.getContextPath() %>/images/bookmark.png" alt="bookmark" class="bookmark-img">
            </button>
            <button class="icon" onclick="location.href='<%= request.getContextPath() %>/pages/alert.html'">
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
        <section class="signup-success">
            <h1>회원가입에 성공하셨습니다!</h1>
            <p>AI Steam Guide에 오신 것을 환영합니다. 지금 바로 로그인을 시도해 보세요!</p>
            <button class="login-redirect-btn" onclick="location.href='<%= request.getContextPath() %>/pages/login.html'">로그인 화면으로 돌아가기</button>
        </section>
    </main>

    <div id="footer"></div>

    <script>
    // footer.jsp 파일을 동적으로 로드
    fetch('<%= request.getContextPath() %>/pages/footer.jsp')
        .then(response => response.text())
        .then(data => {
            document.getElementById('footer').innerHTML = data;
        })
        .catch(error => {
            console.error("Footer를 로드하는 데 실패했습니다:", error);
        });
	</script>
</body>
</html>
