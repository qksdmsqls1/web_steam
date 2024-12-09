<%@ page contentType="text/html; charset=UTF-8" language="java" %>
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
            <li><a href="../pages/community.jsp">Community</a></li> 
            <li><a href="../pages/AI_choice.jsp">AI_choice</a></li> 
            <li><a href="../pages/sale.jsp">Sale games</a></li> 
            <li><a href="../pages/library.jsp">Library</a></li>
        </ul>
    </nav>

    <main>

        <section class="profile">
            <div class="profile-header">
                <img src="<%= request.getAttribute("userProfileImage") %>" alt="프로필 사진" class="profile-image">
                <div class="profile-info">
                    <h2 class="profile-name"><%= username %> ▼</h2>
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
                    <p class="profile-steam_ID">스팀 ID: <%= steamId %></p>

                    <button class="edit-profile-btn" onclick="location.href='profile_edit.jsp'">수정</button>
                </div>
            </div>
        </section>
        
        <section class="recommended-games">
            <h3>“<%= request.getAttribute("userName") %>”님이 추천받은 AI 게임</h3>
            <div class="game-carousel">
                <!-- 추천 게임 카드 -->
                <div class="recommended-game-card">
                    <img src="../images/game.png" alt="Wide on Flash" class="recommended-game-image">
                    <div class="recommended-game-info">
                        <p class="recommended-game-title">Wide on Flash</p>
                        <p class="recommended-game-desc">스릴 넘치는 퍼즐과 모험을 제공합니다.</p>
                        <button class="recommended-game-btn">자세히 보기</button>
                    </div>
                </div>
                <div class="recommended-game-card">
                    <img src="../images/game.png" alt="Soul Mask" class="recommended-game-image">
                    <div class="recommended-game-info">
                        <p class="recommended-game-title">Soul Mask</p>
                        <p class="recommended-game-desc">영혼과의 싸움을 즐길 수 있습니다.</p>
                        <button class="recommended-game-btn">자세히 보기</button>
                    </div>
                </div>
            </div>
        </section>

        <section class="user-reviews">
            <h3>“<%= request.getAttribute("userName") %>”님이 남긴 평가</h3>
            <div class="review-list">
                <!-- 예시 평가 -->
                <div class="review-item">
                    <div class="review-header">
                        <span class="review-icon">📝</span>
                        <h4>친구 없으면 하지 마세요</h4>
                    </div>
                    <p>게임의 협동 모드가 재밌지만 혼자 하기엔 힘듭니다. 친구와 같이 즐기면 더욱 재미있습니다.</p>
                    <div class="review-footer">
                        <span class="review-date">2023-12-01</span>
                        <button>상세 보기</button>
                    </div>
                </div>
                <div class="review-item">
                    <div class="review-header">
                        <span class="review-icon">📝</span>
                        <h4>최고의 시뮬레이션 게임</h4>
                    </div>
                    <p>My Time at Portia는 정원 가꾸기, 마을 탐험 등 다양한 재미를 제공합니다.</p>
                    <div class="review-footer">
                        <span class="review-date">2023-12-02</span>
                        <button>상세 보기</button>
                    </div>
                </div>
            </div>
            <button class="load-more-btn">더보기</button>
        </section>
    </main>
    
    <div id="footer"></div>

    <script>
        // footer.jsp 파일을 동적으로 로드
        fetch('../pages/footer.jsp')
            .then(response => response.text())
            .then(data => {
                document.getElementById('footer').innerHTML = data;
            });

        // 로그인/회원가입 버튼 클릭 시 페이지 이동
        document.addEventListener('DOMContentLoaded', () => {
            const loginButton = document.querySelector('.login-btn');
            if (loginButton) {
                loginButton.addEventListener('click', () => {
                    window.location.href = '../pages/login.jsp'; // 로그인 페이지로 이동
                });
            }
        });

        document.addEventListener('DOMContentLoaded', () => {
            const mainLink = document.querySelector('.logo'); // 텍스트를 감싼 클래스 선택
            if (mainLink) {
                mainLink.addEventListener('click', () => {
                    window.location.href = '../pages/main.jsp'; // 메인 페이지로 이동
                });
            }
        });
    </script>
</body>
</html>
