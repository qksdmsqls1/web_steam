<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.*, java.net.*, org.json.simple.*, org.json.simple.parser.*" %>
<%@ page import="java.sql.*, javax.sql.*, java.io.*, java.net.*" %>
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
            <%
                String username = (String) session.getAttribute("username");
                if (username != null) {
            %>
            <!-- 로그인한 경우 -->
            <a href="../pages/profile.jsp" class="profile-name">안녕하세요, <%= username %></a>
            <form action="../pages/logout.jsp" method="post" style="display: inline;">
                <button type="submit" class="logout-btn">로그아웃</button>
            </form>
            <%
                } else {
            %>
            <!-- 로그인하지 않은 경우 -->
            <button class="login-btn" onclick="window.location.href='../pages/login.jsp';">로그인/회원가입</button>
            <%
                }
            %>        
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
    <%

                        // 데이터베이스 연결 정보
                        String dbURL = "jdbc:mariadb://gwedu.org:3306/team2";
                        String dbUser = "team2";
                        String dbPassword = "a1234";

                        // 데이터베이스에서 steam_id를 가져오는 쿼리
                        String steamId = "";
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
                            }

                            rs.close();
                            pstmt.close();
                            conn.close();
                        } catch (Exception e) {
                            e.printStackTrace();
                        }
					%>
    <% 
            // steam_id가 있는지 확인하여 페이지 리디렉션
            if (steamId != null && !steamId.trim().isEmpty()) {
                response.sendRedirect("librarywin.jsp");
            } else {
                response.sendRedirect("library.jsp");
            }
    %>

    <main>
        <!-- Featured Game Section -->
        <section class="featured-game">
            <a href="details.jsp">
                <img src="../images/game.png" alt="Beyond: Two Souls" class="game-image">
            </a>
        </section>
        
        <section class="game-description">
            <h2>Beyond: Two Souls</h2>
            <p>
                이번 AI가 10월의 Best game으로 뽑았습니다! <br>
                Beyond: Two Souls는 주변 동료들과 함께하며 좀비 세계에서<br>
                이 세계를 탈출하는 게임으로 스릴러, 퍼즐, 협동을 총망라한...
            </p>
            <div class="featured-price-container">
                <div class="price-top">
                    <span class="featured-original-price">$19,000원</span>
                </div>
                <div class="price-bottom">
                    <span class="featured-discount-box">-60%</span>
                    <span class="featured-discount-price">$7,000원</span>
                </div>
                <button class="featured-game-bookmark">
                    <img src="../images/bookmark.png" alt="Bookmark" class="featured-game-bookmark-img">
                </button>
            </div>
        </section>
        
        <!-- Categories Section -->
        <section class="categories">
            <h2>그 외 10월의 Best Game</h2>
            <div class="category-row">
                <%-- 반복적으로 표시되는 게임 정보는 서버에서 가져올 수 있습니다 --%>
                <%
                    String[][] games = {
                        {"The Last of Us Part 1", "../images/game.png", "$19,000원", "-25%", "$14,250원"},
                        {"ARATUS", "../images/game.png", "$15,000원", "-30%", "$10,500원"},
                        {"Hades", "../images/game.png", "$10,000원", "-50%", "$5,000원"}
                    };
                    for (String[] game : games) {
                %>
                <div class="game-card">
                    <img src="<%= game[1] %>" alt="<%= game[0] %>" class="game-image">
                    <div class="game-info">
                        <p class="game-title"><%= game[0] %></p>
                        <p>게임설명입니다</p>
                        <div class="price-container">
                            <span class="original-price"><%= game[2] %></span>
                            <span class="discount-box"><%= game[3] %></span>
                            <span class="discount-price"><%= game[4] %></span>
                        </div>
                    </div>
                </div>
                <% } %>
            </div>
        </section>

        <!-- Free Games Section -->
        <section class="free-games">
            <h2>무료 Game</h2>
            <div class="free-game-row">
                <%-- 무료 게임 리스트는 서버에서 동적으로 생성 가능 --%>
                <%
                    String[][] freeGames = {
                        {"Baldur's Gate", "../images/game.png", "무료"},
                        {"Rust", "../images/game.png", "무료"},
                        {"Call of Duty", "../images/game.png", "무료"}
                    };
                    for (String[] freeGame : freeGames) {
                %>
                <div class="free-game-card">
                    <img src="<%= freeGame[1] %>" alt="<%= freeGame[0] %>" class="free-game-image">
                    <div class="free-game-info">
                        <p class="free-game-title"><%= freeGame[0] %></p>
                        <p>혁명이 되어가는 게임! 이 게임을 해보고 싶다면 어떻게 해야하죠? 어떤 설명을 남아야 하죠?</p>
                        <span class="free-game-price"><%= freeGame[2] %></span>
                    </div>
                </div>
                <% } %>
            </div>
            <button class="free-game-more-btn">더보기</button>
        </section>
    </main>

    <!-- Steam Guide YouTube Section -->
    <section class="steam-guide-youtube">
        <h2>Steam 가이드 Youtube</h2>
        <div class="youtube-row">
            <div class="youtube-card">
                <a href="https://www.youtube.com/watch?v=Asb40dQGi-0" target="_blank">
                    <img src="https://img.youtube.com/vi/Asb40dQGi-0/hqdefault.jpg" alt="What is Steam?" class="youtube-thumbnail">
                    <div class="play-button"></div>
                </a>
                <p class="youtube-title">What is Steam?</p>
            </div>
            <div class="youtube-card">
                <a href="https://www.youtube.com/watch?v=HCCVLZhwhvA" target="_blank">
                    <img src="https://img.youtube.com/vi/HCCVLZhwhvA/hqdefault.jpg" alt="Level 99 Explained" class="youtube-thumbnail">
                    <div class="play-button"></div>
                </a>
                <p class="youtube-title">Level 99 Explained</p>
            </div>
            <div class="youtube-card">
                <a href="https://www.youtube.com/watch?v=ZDC_xL3lffk" target="_blank">
                    <img src="https://img.youtube.com/vi/ZDC_xL3lffk/hqdefault.jpg" alt="Steam Deck Guide" class="youtube-thumbnail">
                    <div class="play-button"></div>
                </a>
                <p class="youtube-title">You Need This - Steam Deck</p>
            </div>
            <div class="youtube-card">
                <a href="https://www.youtube.com/watch?v=PoNOcj-_db8&t=414s" target="_blank">
                    <img src="https://img.youtube.com/vi/PoNOcj-_db8/hqdefault.jpg" alt="Steam on Chromebook" class="youtube-thumbnail">
                    <div class="play-button"></div>
                </a>
                <p class="youtube-title">Steam on Chromebook</p>
            </div>
        </div>
    </section>
    
    <!-- Footer (Dynamic Load) -->
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
