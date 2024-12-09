<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page import="java.io.*, java.net.*, org.json.simple.*, org.json.simple.parser.*" %>
<%@ page import="java.sql.*, javax.sql.*, java.io.*, java.net.*" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>AI Steam Guide - 프로필 수정</title>
    <link rel="stylesheet" href="../css/styles.css">
    <link rel="stylesheet" href="../css/navbar.css">
    <link rel="stylesheet" href="../css/profile.css">
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
            <button class="icon" onclick="location.href='../pages/alert.jsp'">
                <img src="../images/notification-icon.png" alt="Notification Icon" class="icon-img">
            </button>
            <%
                String username = (String) session.getAttribute("username");
                if (username != null) {
            %>
            <a href="../pages/profile.jsp" class="profile-name">안녕하세요, <%= username %></a>
            <form action="../pages/logout.jsp" method="post" style="display: inline;">
                <button type="submit" class="logout-btn">로그아웃</button>
            </form>
            <%
                } else {
            %>
            <button class="login-btn" onclick="window.location.href='../pages/login.jsp';">로그인/회원가입</button>
            <%
                }
            %>
        </div>
    </header>

    <nav class="secondary-menu">
        <ul>
            <li><a href="../pages/community.jsp">Community</a></li> 
            <li><a href="../pages/AI_choice.jsp">AI_choice</a></li> 
            <li><a href="../pages/sale.jsp">Sale games</a></li> 
            <li><a href="../pages/library.jsp">Library</a></li>
        </ul>
    </nav>

    <main>
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
                	<label for="userName">SteamID</label>
                    <input type="text" id="steamId" name="steamId" value="<%= request.getParameter("steamId") != null ? request.getParameter("steamId") : "" %>" required>
                    <%

                        // 데이터베이스 연결 정보
                        String dbURL = "jdbc:mariadb://gwedu.org:3306/team2";
                        String dbUser = "team2";
                        String dbPassword = "a1234";

                        // 데이터베이스에서 steam_id를 가져오는 쿼리
                        String steamId = "";
                        String userName = "";
                        
                        try {
                            // 데이터베이스 연결
                            Connection conn = DriverManager.getConnection(dbURL, dbUser, dbPassword);

                            // 사용자 이름을 기반으로 steam_id 가져오는 쿼리
                            String query = "SELECT steam_id FROM users WHERE username = ?";
                            PreparedStatement pstmt = conn.prepareStatement(query);
                            pstmt.setString(1, username);

                            ResultSet rs = pstmt.executeQuery();
                            if (rs.next()) {
                                // steam_id 가져오기
                                steamId = rs.getString("steam_id");
                                userName = rs.getString("username");
                            }

                            rs.close();
                            pstmt.close();
                            conn.close();
                        } catch (Exception e) {
                            e.printStackTrace();
                        }
					%>

                </div>
                <button type="submit" class="save-btn">수정 내용 저장</button>
            </form>
        </section>
    </main>

    <div id="footer"></div>

    <div id="footer"></div>

    <script>
        fetch('../pages/footer.jsp')
            .then(response => response.text())
            .then(data => {
                document.getElementById('footer').innerHTML = data;
            });


    </script>
</body>
</html>
