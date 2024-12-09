<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>AI Steam Guide</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/styles.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/navbar.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/login.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/footer.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/signup.css">
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
            <button class="bookmark">
                <img src="<%= request.getContextPath() %>/images/bookmark.png" alt="bookmark" class="bookmark-img">
            </button>
            <button class="icon">
                <img src="<%= request.getContextPath() %>/images/notification-icon.png" alt="Notification Icon" class="icon-img">
            </button>            
            <button class="login-btn">로그인/회원가입</button>
        </div>
    </header>
    
    <nav class="secondary-menu">
        <ul>
            <li><a href="#">Community</a></li>
            <li><a href="<%= request.getContextPath() %>/pages/AI_choice.jsp">AI_choice</a></li> 
            <li><a href="#">Sale games</a></li>
            <li><a href="<%= request.getContextPath() %>/pages/library.jsp">Library</a></li>
        </ul>
    </nav>

    <main>
        <section class="signup-section">
            <h1>AI Steam Guide</h1>
            <h2>환영합니다!</h2>
            <form class="signup-form" method="post" action="<%= request.getContextPath() %>/pages/signupAction.jsp">
                <div class="form-group">
                    <label for="nickname">닉네임</label>
                    <input type="text" id="nickname" name="nickname" placeholder="닉네임" required>
                    <span class="status-indicator"></span>
                </div>
                <div class="form-group">
                    <label for="email">아이디(이메일 형식)</label>
                    <input type="text" id="email" name="email" placeholder="아이디" required>
                    <span class="status-indicator"></span>
                </div>
                <div class="form-group">
                    <label for="password">비밀번호</label>
                    <input type="password" id="password" name="password" placeholder="비밀번호" required>
                    <span class="status-indicator"></span>
                </div>
                <div class="form-group">
                    <label for="password-confirm">비밀번호 재확인</label>
                    <input type="password" id="password-confirm" name="password-confirm" placeholder="비밀번호 재확인" required>
                    <span class="status-indicator"></span>
                </div>
                <div class="form-group">
                    <label>
                        <input type="checkbox" id="agree-terms" name="agree-terms" required>
                        ASG의 약관에 동의하십니까?
                    </label>
                </div>
                <button type="submit" class="signup-btn">등록</button>
            </form>
        </section>
    </main>

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
        	})
        	.catch(error => {
            	console.error("Footer를 로드하는 데 실패했습니다:", error);
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
        document.addEventListener('DOMContentLoaded', () => {
            const mainLink = document.querySelector('.logo'); // 텍스트를 감싼 클래스 선택
            if (mainLink) {
                mainLink.addEventListener('click', () => {
                    window.location.href = '<%= request.getContextPath() %>/pages/main.jsp'; // 메인 페이지로 이동
                });
            }
        });
    </script>
</body>
</html>
