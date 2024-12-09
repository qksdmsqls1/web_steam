<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>로그인 처리</title>
</head>
<body>
    <%
        // 로그인 성공 여부 초기화
        boolean isLoginSuccessful = false;

        // POST 요청인지 확인
        if ("POST".equalsIgnoreCase(request.getMethod())) {
            String email = request.getParameter("email");
            String password = request.getParameter("password");

            // 데이터베이스 연결 정보
            String dbURL = "jdbc:mariadb://gwedu.org:3306/team2";
            String dbUser = "team2";
            String dbPassword = "a1234";

            try {
                // 데이터베이스 드라이버 로드
                Class.forName("org.mariadb.jdbc.Driver");

                // 데이터베이스 연결
                Connection conn = DriverManager.getConnection(dbURL, dbUser, dbPassword);

                // 사용자 인증 쿼리 실행
                String query = "SELECT * FROM users WHERE email = ? AND password = ?";
                PreparedStatement pstmt = conn.prepareStatement(query);
                pstmt.setString(1, email);
                pstmt.setString(2, password);
                ResultSet rs = pstmt.executeQuery();

                if (rs.next()) {
                    isLoginSuccessful = true; // 로그인 성공
                }

                rs.close();
                pstmt.close();
                conn.close();
            } catch (Exception e) {
                out.println("<p>오류가 발생했습니다: " + e.getMessage() + "</p>");
                e.printStackTrace();
            }

            // 결과에 따른 페이지 이동
            if (isLoginSuccessful) {
                session.setAttribute("user", email); // 세션에 사용자 정보 저장
                response.sendRedirect("main.jsp"); // 메인 페이지로 리다이렉트
            } else {
                response.sendRedirect("login_failed.jsp"); // 로그인 실패 페이지로 리다이렉트
            }
        }
    %>
</body>
</html>
