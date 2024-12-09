<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page import="java.sql.*, javax.sql.*, java.io.*, java.net.*, javax.servlet.http.*, javax.servlet.*" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>프로필 수정 완료</title>
</head>
<body>
    <h2>프로필 수정 완료</h2>
    <%
        // 사용자로부터 입력받은 steamId와 userName
        String steamId = request.getParameter("steamId"); // 입력받은 steamId
        String newUserName = request.getParameter("userName"); // 입력받은 userName

        // 세션에서 username을 가져오는 부분과 혼동되지 않도록, 입력받은 username을 사용
        if (newUserName == null || newUserName.trim().isEmpty()) {
            out.println("<p>유효하지 않은 사용자 이름입니다.</p>");
            return;
        }

        // 데이터베이스 연결 정보
        String dbURL = "jdbc:mariadb://gwedu.org:3306/team2";
        String dbUser = "team2";
        String dbPassword = "a1234";

        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            // 데이터베이스 연결
            conn = DriverManager.getConnection(dbURL, dbUser, dbPassword);

            // steamId가 비어 있으면 null로 설정
            if (steamId == null || steamId.trim().isEmpty()) {
                steamId = null; // steamId가 비었으면 null로 설정
            }

            // username과 steam_id를 업데이트하는 쿼리
            String updateQuery = "UPDATE users SET username = ?, steam_id = ? WHERE username = ?";
            pstmt = conn.prepareStatement(updateQuery);
            pstmt.setString(1, newUserName);  // 새로운 userName
            pstmt.setString(2, steamId);  // 새로운 steam_id (null이면 null)
            pstmt.setString(3, session.getAttribute("username").toString());  // 기존 사용자 이름으로 업데이트

            // 쿼리 실행
            int rowsUpdated = pstmt.executeUpdate();
            if (rowsUpdated > 0) {
                // 프로필 업데이트 성공, 세션에 새로운 username을 반영
                session.setAttribute("username", newUserName);  // 세션에 새로운 username 설정
                out.println("<p>프로필이 성공적으로 업데이트되었습니다.</p>");
            } else {
                out.println("<p>프로필 업데이트에 실패했습니다. 다시 시도해주세요.</p>");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            out.println("<p>데이터베이스 연결 오류가 발생했습니다.</p>");
        } finally {
            try {
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    %>
    <a href="profile.jsp">프로필 페이지로 돌아가기</a>
</body>
</html>
