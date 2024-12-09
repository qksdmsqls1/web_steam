<!-- login3.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>AI Steam Guide - 로그인</title>
    <script>
        function redirectToSteamLogin() {
            const returnTo = encodeURIComponent('https://a246-59-0-18-216.ngrok-free.app/steam_login_callback.jsp'); // 정확한 리디렉션 URI
            const realm = encodeURIComponent('https://a246-59-0-18-216.ngrok-free.app'); // 인증 요청의 도메인

            const steamLoginUrl = `https://steamcommunity.com/openid/login?openid.ns=http://specs.openid.net/auth/2.0&openid.mode=checkid_setup&openid.identity=http://specs.openid.net/auth/2.0/identifier_select&openid.claimed_id=http://specs.openid.net/auth/2.0/identifier_select&openid.return_to=${returnTo}&openid.realm=${realm}`;

            window.location.href = steamLoginUrl; // Steam 로그인 페이지로 리다이렉트
        }
    </script>
</head>
<body>
    <h1>AI Steam Guide 로그인 페이지</h1>
    <button onclick="redirectToSteamLogin()">Steam으로 로그인</button>
</body>
</html>

