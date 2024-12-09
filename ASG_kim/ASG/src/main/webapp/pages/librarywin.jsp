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
    <link rel="stylesheet" href="../css/librarywin.css">
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
            <li><a href="../pages/coummnity.jsp">Community</a></li> 
            <li><a href="../pages/AI_choice.jsp">AI_choice</a></li> 
            <li><a href="../pages/sale.jsp">Sale games</a></li> 
            <li><a href="../pages/library.jsp">Library</a></li>
        </ul>
    </nav>

    <main>
        <section class="library-container">
            <!-- 프로필과 설명 -->
            <div class="library-header">
                <img src="../images/game.png" alt="프로필 이미지" class="profile-img">
                <div class="library-info">
    					<h3><%= username %>님의 라이브러리</h3>
    					<p>AI가 <%= username %>님의 라이브러리를 분석해 맞는 게임을 추천해드립니다</p>
				</div>
                <div class="library-status">
                    <span>Steam 라이브러리 연동 성공</span>
                </div>
            </div>
        
            <!-- 연동 성공 텍스트와 버튼 -->
            <div class="sync-success">
                <h2>연동 성공</h2>
                <button class="ai-choice" onclick="location.href='AI_choice.jsp'">분석하기</button>
            </div>
        
            <!-- 게임 리스트 -->
            <div class="game-list">
                <div class="game-row">
                    <%
                        int count = 0;

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

                        if (steamId != null && !steamId.isEmpty()) {
                            // Steam API 키와 Steam ID 설정
                            String apiKey = "BD8E68F67F2E6681BCE168F2504D375F"; // Steam API 키
                            String apiUrl = "https://api.steampowered.com/IPlayerService/GetOwnedGames/v1/?key=" + apiKey + "&steamid=" + steamId + "&format=json";
                            String appListUrl = "https://api.steampowered.com/ISteamApps/GetAppList/v2/"; // 게임 이름을 얻기 위한 앱 리스트 API

                            // API 호출로부터 소유한 게임 목록 얻기
                            try {
                                // URL 객체 생성하여 Steam API 호출
                                URL url = new URL(apiUrl);
                                HttpURLConnection connection = (HttpURLConnection) url.openConnection();
                                connection.setRequestMethod("GET");
                                connection.setConnectTimeout(5000);
                                connection.setReadTimeout(5000);

                                // API 응답 받기
                                BufferedReader in = new BufferedReader(new InputStreamReader(connection.getInputStream()));
                                String inputLine;
                                StringBuilder apiResponse = new StringBuilder(); 
                                while ((inputLine = in.readLine()) != null) {
                                    apiResponse.append(inputLine);
                                }
                                in.close();

                                // JSON 응답 파싱
                                JSONObject jsonResponse = (JSONObject) new JSONParser().parse(apiResponse.toString());
                                JSONObject responseObject = (JSONObject) jsonResponse.get("response");
                                JSONArray gamesArray = (JSONArray) responseObject.get("games");

                                // 앱 리스트를 가져오는 API 호출
                                URL appListUrlObj = new URL(appListUrl);
                                HttpURLConnection appListConnection = (HttpURLConnection) appListUrlObj.openConnection();
                                appListConnection.setRequestMethod("GET");
                                BufferedReader appListReader = new BufferedReader(new InputStreamReader(appListConnection.getInputStream()));
                                StringBuilder appListResponse = new StringBuilder();
                                while ((inputLine = appListReader.readLine()) != null) {
                                    appListResponse.append(inputLine);
                                }
                                appListReader.close();
                                
                                // 앱 리스트 응답 파싱
                                JSONObject appListJson = (JSONObject) new JSONParser().parse(appListResponse.toString());
                                JSONObject appListData = (JSONObject) appListJson.get("applist");
                                JSONArray appArray = (JSONArray) appListData.get("apps");
                                java.util.Map<Long, String> appMap = new java.util.HashMap<>();
                                
                                // 앱 리스트에서 appid와 게임 이름 매핑
                                for (Object appObj : appArray) {
                                    JSONObject app = (JSONObject) appObj;
                                    Long appid = (Long) app.get("appid");
                                    String name = (String) app.get("name");
                                    appMap.put(appid, name);
                                }

                                // 각 게임에 대해 appid로 이름과 이미지 조회
                                for (int i = 0; i < gamesArray.size(); i++) {
                                    JSONObject game = (JSONObject) gamesArray.get(i);
                                    Long appid = (Long) game.get("appid");
                                    Long playtime = (Long) game.get("playtime_forever");

                                    // appid로 게임 이름 조회
                                    String gameName = appMap.get(appid);

                                    // 세부 정보 API를 통해 게임 이미지 URL 가져오기
                                    String gameImageUrl = "";  // 기본값
                                    try {
                                        String gameDetailsUrl = "https://store.steampowered.com/api/appdetails?appids=" + appid;
                                        URL gameDetailsApiUrl = new URL(gameDetailsUrl);
                                        HttpURLConnection gameDetailsConnection = (HttpURLConnection) gameDetailsApiUrl.openConnection();
                                        gameDetailsConnection.setRequestMethod("GET");

                                        BufferedReader gameDetailsReader = new BufferedReader(new InputStreamReader(gameDetailsConnection.getInputStream()));
                                        StringBuilder gameDetailsResponse = new StringBuilder();
                                        while ((inputLine = gameDetailsReader.readLine()) != null) {
                                            gameDetailsResponse.append(inputLine);
                                        }
                                        gameDetailsReader.close();

                                        // 응답에서 이미지 URL 추출
                                        JSONObject gameDetailsJson = (JSONObject) new JSONParser().parse(gameDetailsResponse.toString());
                                        JSONObject appDetails = (JSONObject) gameDetailsJson.get(appid.toString());
                                        JSONObject appData = (JSONObject) appDetails.get("data");
                                        gameImageUrl = (String) appData.get("header_image");
                                    } catch (Exception e) {
                                        e.printStackTrace();
                                    }

                                    if (gameName != null && playtime != null && gameImageUrl != null) {
                                        count++;
                                 {
                                %>
                                <div class="game-card">
                                    <img src="<%= gameImageUrl %>" alt="<%= gameName %>" class="game-img">
                                    <h4><%= gameName %></h4>
                                    <p>플레이 시간: <%= playtime %>분</p>
                                </div>
                                <%
                                    }
                                }
                            }
                        } catch (Exception e) {
                            e.printStackTrace();
                        }
                    }
                    %>
                </div>
            </div>
        </section>
    </main>

    <footer id="footer"></footer>

    <script>
        // footer.html 파일을 동적으로 로드
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

        document.addEventListener('DOMContentLoaded', function() {
            const bookmarkButton = document.querySelector('.bookmark');
            bookmarkButton.addEventListener('click', function() {
                window.location.href = '../pages/bookmark.jsp'; // 북마크 페이지로 이동
            });
        });
    </script>
</body>
</html>
