package steamhelp;

import java.io.*;
import java.net.*;
import javax.servlet.*;
import javax.servlet.http.*;
import org.json.simple.JSONObject;
import org.json.simple.JSONArray;
import org.json.simple.parser.JSONParser;
import java.util.List;
import java.util.ArrayList;

public class SteamGameServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Steam API 키와 Steam ID 설정
        String apiKey = "BD8E68F67F2E6681BCE168F2504D375F";
        String steamId = "76561199220859566";
        String apiUrl = "https://api.steampowered.com/IPlayerService/GetOwnedGames/v1/?key=" + apiKey + "&steamid=" + steamId + "&format=json";
        String appListUrl = "https://api.steampowered.com/ISteamApps/GetAppList/v2/";

        try {
            // API 호출 및 응답 받기
            URL url = new URL(apiUrl);
            HttpURLConnection connection = (HttpURLConnection) url.openConnection();
            connection.setRequestMethod("GET");
            connection.setConnectTimeout(5000);
            connection.setReadTimeout(5000);

            BufferedReader in = new BufferedReader(new InputStreamReader(connection.getInputStream()));
            StringBuilder apiResponse = new StringBuilder();
            String inputLine;
            while ((inputLine = in.readLine()) != null) {
                apiResponse.append(inputLine);
            }
            in.close();

            // JSON 파싱
            JSONObject jsonResponse = (JSONObject) new JSONParser().parse(apiResponse.toString());
            JSONObject responseObject = (JSONObject) jsonResponse.get("response");
            JSONArray gamesArray = (JSONArray) responseObject.get("games");

            // 앱 리스트 API 호출
            URL appListUrlObj = new URL(appListUrl);
            HttpURLConnection appListConnection = (HttpURLConnection) appListUrlObj.openConnection();
            appListConnection.setRequestMethod("GET");
            BufferedReader appListReader = new BufferedReader(new InputStreamReader(appListConnection.getInputStream()));
            StringBuilder appListResponse = new StringBuilder();
            while ((inputLine = appListReader.readLine()) != null) {
                appListResponse.append(inputLine);
            }
            appListReader.close();

            // 앱 리스트 파싱
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

            // 게임 목록과 이미지 URL을 전달할 준비
            List<Game> gameList = new ArrayList<>();

            // 각 게임에 대해 처리
            for (int i = 0; i < gamesArray.size(); i++) {
                JSONObject game = (JSONObject) gamesArray.get(i);
                Long appid = (Long) game.get("appid");
                Long playtime = (Long) game.get("playtime_forever");
                String gameName = appMap.get(appid);
                Boolean isFree = (Boolean) game.get("is_free");
                String freeStatus = (isFree != null && isFree) ? "무료" : "유료";

                // 게임 이미지 URL 가져오기
                String gameImageUrl = GameUtils.getGameImageUrl(appid);

                // Game 객체 생성 및 gameList에 추가
                Game g = new Game(gameName, playtime, freeStatus, gameImageUrl);
                gameList.add(g);
            }

            // 게임 목록을 request에 저장하고 JSP로 포워드
            request.setAttribute("g", gameList);

            // gameList.jsp로 요청 전달 (포워딩)
            RequestDispatcher dispatcher = request.getRequestDispatcher("gameList.jsp");
            dispatcher.forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("API 호출 실패: " + e.getMessage());
        }
    }
}
