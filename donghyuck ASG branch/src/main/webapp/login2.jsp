<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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



<!-- Login Section -->

<main class="login-container">

<h1 class="login-title">AI Steam Guide</h1>

<form class="login-form" action="login_check.jsp" method="post">

<input type="text" name="email" placeholder="이메일" class="input-field" required>

<input type="password" name="password" placeholder="비밀번호" class="input-field" required>

<button type="submit" class="login-btn">로그인</button>

<div class="form-options">

<a href="find_id_pw.jsp" class="option-link">아이디/비밀번호 찾기</a>

<a href="sign_up.jsp" class="option-link">회원가입</a>

</div>

<button type="button" class="steam-login-btn" onclick="redirectToSteamLogin()">

<img src="<%= request.getContextPath() %>/images/steam-icon.png" alt="Steam Icon" class="steam-icon">

Steam으로 로그인

</button>

</form>

</main>



<!-- Footer Section -->

<div id="footer"></div>



<style>

.logo {

cursor: pointer;

}

</style>


<script>

// 푸터를 동적으로 로드하는 JavaScript 코드

fetch('../pages/footer.html')

.then(response => response.text())

.then(data => {

document.getElementById('footer').innerHTML = data;

});



// "AI STEAM GUIDE" 클릭 시 메인 페이지로 이동

document.addEventListener('DOMContentLoaded', () => {

const mainLink = document.querySelector('.logo');

if (mainLink) {

mainLink.addEventListener('click', () => {

window.location.href = '../pages/main.jsp';

});

}

});



// 스팀 로그인 리다이렉션

function redirectToSteamLogin() {

const clientId = 'YOUR_STEAM_CLIENT_ID'; // 스팀 클라이언트 ID

const redirectUri = encodeURIComponent('http://yourdomain.com/steam_login_callback.jsp'); // 리디렉션 URI

const scope = 'identity'; // 요청할 스코프



const steamLoginUrl = `https://steamcommunity.com/openid/login?openid.ns=http://specs.openid.net/auth/2.0&openid.mode=checkid_setup&openid.identity=http://specs.openid.net/auth/2.0/identifier_select&openid.claimed_id=http://specs.openid.net/auth/2.0/identifier_select&openid.return_to=${redirectUri}&openid.realm=${redirectUri}&openid.response_type=code`;



window.location.href = steamLoginUrl; // 스팀 로그인 페이지로 리다이렉트

}

</script>

</body>

</html>

