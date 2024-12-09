<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.io.*, java.net.*, org.json.simple.JSONObject, org.json.simple.JSONArray, org.json.simple.parser.JSONParser" %>

<%
    // Steam API 키와 Steam ID 설정
    String apiKey = "BD8E68F67F2E6681BCE168F2504D375F"; // Steam API 키
    String steamId = "76561199220859566"; // 사용자의 Steam ID
    String apiUrl = "https://api.steampowered.com/IPlayerService/GetOwnedGames/v1/?key=" + apiKey + "&steamid=" + steamId + "&format=json";
    String appListUrl = "https://api.steampowered.com/ISteamApps/GetAppList/v2/"; // 게임 이름을 얻기 위한 앱 리스트 API
%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>소유한 게임 목록</title>
</head>
<body>
    <h1>소유한 게임 목록</h1>
    <table border="1" cellpadding="10">
        <thead>
            <tr>
                <th>게임 이름</th>
                <th>플레이 시간 (분)</th>
            </tr>
        </thead>
        <tbody>
            <%
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

                    // 각 게임에 대해 appid로 이름을 조회
                    for (int i = 0; i < gamesArray.size(); i++) {
                        JSONObject game = (JSONObject) gamesArray.get(i);
                        Long appid = (Long) game.get("appid");
                        Long playtime = (Long) game.get("playtime_forever");

                        // appid로 게임 이름 조회
                        String gameName = appMap.get(appid);

                        // 테이블에 게임 이름과 플레이 시간 출력
            %>
           		<tr>
    				<td><%= gameName != null ? gameName : "알 수 없음 (App ID: " + appid + ")" %></td>
    				<td><%= playtime %> 분</td>
				</tr>

            <%
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                    out.println("API 호출 실패: " + e.getMessage());
                }
            %>
        </tbody>
    </table>
</body>
</html>
