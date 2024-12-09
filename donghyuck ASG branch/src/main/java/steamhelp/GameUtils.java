package steamhelp;

import java.io.*;
import java.net.*;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

public class GameUtils {

    // 게임 이미지 URL을 반환하는 메소드
    public static String getGameImageUrl(Long appid) {
        try {
            // Steam에서 게임에 대한 상세 정보를 가져오기 위한 API URL
            String detailsUrl = "https://store.steampowered.com/api/appdetails?appids=" + appid;
            URL url = new URL(detailsUrl);
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
            
            // 응답에서 appid로 해당 게임 정보 가져오기
            JSONObject appDetails = (JSONObject) jsonResponse.get(String.valueOf(appid));
            if (appDetails == null || appDetails.get("success") == null || !(Boolean) appDetails.get("success")) {
                return null; // 게임 정보가 없거나 실패한 경우
            }

            JSONObject data = (JSONObject) appDetails.get("data");
            if (data != null && data.containsKey("header_image")) {
                // header_image URL 반환
                return (String) data.get("header_image");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null; // 예외 발생시 null 반환
    }
}
