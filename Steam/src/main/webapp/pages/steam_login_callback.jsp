<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import="java.io.*, java.net.*, javax.servlet.http.*, org.json.simple.JSONObject, org.json.simple.JSONArray, org.json.simple.parser.JSONParser, org.json.simple.parser.ParseException" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Steam Login Callback</title>
</head>
<body>
<%
    // 스팀에서 받은 응답 처리
    String openidClaimedId = request.getParameter("openid.claimed_id");

    if (openidClaimedId == null) {
        out.println("<p>Steam 인증 실패: 잘못된 요청입니다.</p>");
    } else {
        // 스팀 ID 추출
        String steamId = openidClaimedId.substring(openidClaimedId.lastIndexOf('/') + 1);

        // 스팀 API를 통해 사용자 정보 요청
        String apiKey = "BD8E68F67F2E6681BCE168F2504D375F"; // 발급받은 Steam API 키 사용
        String steamUserInfoUrl = "http://api.steampowered.com/ISteamUser/GetPlayerSummaries/v0002/?key=" + apiKey + "&steamids=" + steamId;

        try {
            // URI 객체 생성 후 URL 객체 생성
            URL url = new URI(steamUserInfoUrl).toURL();
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("GET");

            // 응답 처리
            BufferedReader in = new BufferedReader(new InputStreamReader(conn.getInputStream()));
            StringBuilder apiResponse = new StringBuilder();
            String inputLine;
            while ((inputLine = in.readLine()) != null) {
                apiResponse.append(inputLine);
            }
            in.close();

            // JSON 파싱
            JSONParser parser = new JSONParser();
            JSONObject jsonResponse = (JSONObject) parser.parse(apiResponse.toString());
            JSONObject jsonResponseObj = (JSONObject) jsonResponse.get("response");
            JSONArray players = (JSONArray) jsonResponseObj.get("players");

            if (players != null && !players.isEmpty()) {
                JSONObject player = (JSONObject) players.get(0);

                // 플레이어 정보 추출
                String nickname = (String) player.get("personaname");
                String avatarUrl = (String) player.get("avatar");
                String profileUrl = (String) player.get("profileurl");

                // 세션에 사용자 정보 저장
                session.setAttribute("user", nickname);
                session.setAttribute("steamId", steamId);

                // 메인 페이지로 리다이렉트
                response.sendRedirect("main.jsp");
            } else {
                out.println("<p>플레이어 정보를 가져올 수 없습니다.</p>");
            }

        } catch (ParseException e) {
            out.println("<p>JSON 파싱 오류가 발생했습니다: " + e.getMessage() + "</p>");
            e.printStackTrace();
        } catch (Exception e) {
            out.println("<p>오류가 발생했습니다: " + e.getMessage() + "</p>");
            e.printStackTrace();
        }
    }
%>
</body>
</html>
