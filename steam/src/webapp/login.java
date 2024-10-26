import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

public class library_at_steam {
    private static final String API_KEY = "74AA0BCAB510CD748F5267264B124A43";
    private static final String STEAM_ID = "76561199220859566"; // 예시 Steam ID

    public static void main(String[] args) {
        try {
            // API 요청 URL
            String urlString = String.format(
                "http://api.steampowered.com/IPlayerService/GetOwnedGames/v0001/?key=%s&steamid=%s&include_appinfo=true&include_played_free_games=true&format=json",
                API_KEY, STEAM_ID);

            // HTTP 연결 설정
            URL url = new URL(urlString);
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("GET");

            // 응답 코드 확인
            int responseCode = conn.getResponseCode();
            if (responseCode == 200) {
                BufferedReader in = new BufferedReader(new InputStreamReader(conn.getInputStream()));
                StringBuilder content = new StringBuilder();
                String inputLine;
                while ((inputLine = in.readLine()) != null) {
                    content.append(inputLine);
                }
                in.close();

                // JSON 파싱
                JsonObject jsonResponse = JsonParser.parseString(content.toString()).getAsJsonObject();
                JsonArray games = jsonResponse.getAsJsonObject("response").getAsJsonArray("games");

                // 소유 게임 목록 출력
                for (int i = 0; i < games.size(); i++) {
                    JsonObject game = games.get(i).getAsJsonObject();
                    String gameName = game.get("name").getAsString();
                    int playTime = game.get("playtime_forever").getAsInt();

                    System.out.printf("Game: %s, Playtime: %d minutes\n", gameName, playTime);
                }
            } else {
                System.out.println("Error: " + responseCode);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
