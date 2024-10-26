import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

import org.json.JSONObject;

public class main {
    // 발급받은 스팀 API 키를 여기에 입력
    private static final String API_KEY = "74AA0BCAB510CD748F5267264B124A43";

    public static void main(String[] args) {
        String steamId = "76561199220859566";  // 여기에 스팀 ID를 입력하거나 사용자 입력을 받을 수 있음
        String urlString = "http://api.steampowered.com/ISteamUser/GetPlayerSummaries/v0002/?key=" + API_KEY + "&steamids=" + steamId;

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
                JSONObject player = jsonResponse.getJSONObject("response").getJSONArray("players").getJSONObject(0);

                // 정보 출력
                String playerName = player.getString("personaname");
                String profileUrl = player.getString("profileurl");
                int personaState = player.getInt("personastate");

                System.out.println("스팀 유저 정보:");
                System.out.println("이름: " + playerName);
                System.out.println("프로필 URL: " + profileUrl);
                System.out.println("상태: " + (personaState == 1 ? "온라인" : "오프라인"));
            } else {
                System.out.println("API 요청 실패: 응답 코드 " + responseCode);
            }
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("오류 발생: " + e.getMessage());
        }
    }
}
