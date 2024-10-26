import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

import org.json.JSONArray;
import org.json.JSONObject;

public class library_at_steam {
    // 발급받은 Steam API Key
    private static final String API_KEY = "74AA0BCAB510CD748F5267264B124A43";
    // 가져오고 싶은 유저의 Steam ID
    private static final String STEAM_ID = "76561199220859566";

    public static void main(String[] args) {
        String urlString = "http://api.steampowered.com/IPlayerService/GetOwnedGames/v0001/"
                + "?key=" + API_KEY
                + "&steamid=" + STEAM_ID
                + "&include_appinfo=true" // 게임 정보 포함
                + "&format=json";

        try {
            // URL 객체 생성
            URL url = new URL(urlString);
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("GET");
            int responseCode = conn.getResponseCode();

            if (responseCode == HttpURLConnection.HTTP_OK) {
                // 응답 읽기
                BufferedReader in = new BufferedReader(new InputStreamReader(conn.getInputStream()));
                String inputLine;
                StringBuilder response = new StringBuilder();
                while ((inputLine = in.readLine()) != null) {
                    response.append(inputLine);
                }
                in.close();

                // JSON 파싱
                JSONObject jsonResponse = new JSONObject(response.toString());
                JSONObject responseData = jsonResponse.getJSONObject("response");

                if (responseData.has("games")) {
                    JSONArray gamesArray = responseData.getJSONArray("games");

                    System.out.println("총 보유 게임 수: " + responseData.getInt("game_count"));
                    for (int i = 0; i < gamesArray.length(); i++) {
                        JSONObject game = gamesArray.getJSONObject(i);
                        String name = game.getString("name");
                        int playtimeForever = game.getInt("playtime_forever");

                        System.out.println("게임 이름: " + name);
                        System.out.println("총 플레이 시간(분): " + playtimeForever);
                        System.out.println("--------------------------------");
                    }
                } else {
                    System.out.println("사용자가 보유한 게임이 없습니다.");
                }

            } else {
                System.out.println("API 요청 실패: 응답 코드 " + responseCode);
            }
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("오류 발생: " + e.getMessage());
        }
    }
}
