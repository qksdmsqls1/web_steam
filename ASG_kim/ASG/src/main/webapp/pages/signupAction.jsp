<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>회원가입 처리</title>
</head>
<body>
<%
    // 데이터베이스 연결 정보
    String url = "jdbc:mariadb://gwedu.org:3306/team2";
    String dbUser = "team2";
    String dbPassword = "a1234";

    // 사용자 입력 값 가져오기
    String email = request.getParameter("email");
    String username = request.getParameter("nickname");
    String password = request.getParameter("password");
    String passwordConfirm = request.getParameter("password-confirm");

    String message = "";

    // 입력값 검증
    if (email != null && username != null && password != null && passwordConfirm != null) {
        if (!password.equals(passwordConfirm)) {
            message = "비밀번호가 일치하지 않습니다. 다시 시도해주세요.";
        } else {
            try {
                // MariaDB 연결
                Class.forName("org.mariadb.jdbc.Driver");
                Connection conn = DriverManager.getConnection(url, dbUser, dbPassword);

                // SQL 쿼리 작성 및 실행
                String query = "INSERT INTO users (email, password, username) VALUES (?, ?, ?)";
                PreparedStatement pstmt = conn.prepareStatement(query);
                pstmt.setString(1, email); // 이메일
                pstmt.setString(2, password); // 평문 비밀번호
                pstmt.setString(3, username); // 닉네임

                int result = pstmt.executeUpdate();
                if (result > 0) {
                    // 회원가입 성공 시 signup_ok.jsp로 리디렉션
                    response.sendRedirect(request.getContextPath() + "/pages/signup_ok.jsp");
                } else {
                    message = "회원가입 실패. 다시 시도해주세요.";
                }

                pstmt.close();
                conn.close();
            } catch (SQLIntegrityConstraintViolationException e) {
                message = "이미 사용 중인 이메일입니다.";
            } catch (Exception e) {
                message = "오류 발생: " + e.getMessage();
                e.printStackTrace();
            }
        }
    } else {
        message = "모든 필드를 입력해주세요.";
    }
%>
    <% if (message != "") { %>
        <h1><%= message %></h1>
        <a href="<%= request.getContextPath() %>/pages/signup.jsp">뒤로 가기</a>
    <% } %>
</body>
</html>
