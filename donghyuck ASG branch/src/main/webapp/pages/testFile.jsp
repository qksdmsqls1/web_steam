<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.*, java.net.*, org.json.simple.JSONObject, org.json.simple.JSONArray, org.json.simple.parser.JSONParser" %>

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
            <button class="login-btn">로그인/회원가입</button>
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
                    <h3>'닉네임'님의 라이브러리</h3>
                    <p>AI가 '닉네임'님의 라이브러리를 분석해 맞는 게임을 추천해드립니다</p>
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
                        // Steam API에서 소유한 게임을 가져오기
                        String apiKey = "BD8E68F67F2E6681BCE168F2504D375F";
                        String steamId = "76561199220859566"; // 사용자 Steam ID
                        String apiUrl = "https://api.steampowered.com/IPlayerService/GetOwnedGames/v1/?key=" + apiKey + "&steamid=" + steamId + "&format=json";
                        try {
                            URL url = new URL(apiUrl);
                            HttpURLConnection connection = (HttpURLConnection) url.openConnection();
                            connection.setRequestMethod("GET");
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

                            // 각 게임의 이미지를 가져오기
                            for (int i = 0; i < gamesArray.size(); i++) {
                                JSONObject game = (JSONObject) gamesArray.get(i);
                                Long appid = (Long) game.get("appid");

                                // 게임 이미지 URL 가져오기
                                String gameImageUrl = "";
                                String gameName = "";
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
                                    gameName = (String) appData.get("name");
                                } catch (Exception e) {
                                    e.printStackTrace();
                                }
                    %>

                    <div class="game-card">
                        <img src="<%= gameImageUrl %>" alt="<%= gameName != null ? gameName : "알 수 없음" %>" class="game-thumbnail">
                    </div>
                    <%
                            }
                        } catch (Exception e) {
                            e.printStackTrace();
                        }
                    %>
                </div>
            </div>
        </section>
    </main>

    <div id="footer"></div>

    <style>
        .logo {
            cursor: pointer; /* 클릭 가능한 손 모양 커서를 표시 */
        }
    </style>

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
