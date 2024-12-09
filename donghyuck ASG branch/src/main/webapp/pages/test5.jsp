<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="org.json.simple.JSONObject, org.json.simple.JSONArray, org.json.simple.parser.JSONParser, org.json.simple.parser.ParseException" %>
<%
    try {
        String apiKey = "BD8E68F67F2E6681BCE168F2504D375F";  // 자신의 API Key
        String steamId = "76561199220859566";  // 확인할 유저의 Steam ID
        String apiUrl = "https://api.steampowered.com/IPlayerService/GetOwnedGames/v1/?key=" + apiKey + "&steamid=" + steamId + "&format=json";


        // API 호출
        java.net.URL url = new java.net.URL(apiUrl);
        java.net.HttpURLConnection connection = (java.net.HttpURLConnection) url.openConnection();
        connection.setRequestMethod("GET");

        // 응답 코드 및 메시지 출력 (디버깅)
        int responseCode = connection.getResponseCode();
        String responseMessage = connection.getResponseMessage();
        out.println("HTTP Response Code: " + responseCode + "<br>");
        out.println("HTTP Response Message: " + responseMessage + "<br>");

        // 응답 읽기
        java.io.BufferedReader in = new java.io.BufferedReader(new java.io.InputStreamReader(connection.getInputStream()));
        String inputLine;
        StringBuilder apiResponse = new StringBuilder();
        while ((inputLine = in.readLine()) != null) {
            apiResponse.append(inputLine);
        }
        in.close();

        // JSON 파싱 (org.json.simple 사용)
        String responseString = apiResponse.toString();
        JSONParser parser = new JSONParser();
        JSONObject jsonResponse = (JSONObject) parser.parse(responseString);
        
        // "response" 객체가 있는지 확인
        if (jsonResponse.containsKey("response")) {
            JSONObject responseData = (JSONObject) jsonResponse.get("response");
            JSONArray games = (JSONArray) responseData.get("games");

            // 유저의 게임 목록 출력
            for (int i = 0; i < games.size(); i++) {
                JSONObject game = (JSONObject) games.get(i);
                String gameName = (String) game.get("Name"); // 게임 이름
                long appId = (long) game.get("appid");  // appid는 long 타입으로 반환됨

                // 게임 이름이 없거나 null인 경우 처리
                if (gameName == null) {
                    gameName = "Unknown Game"; // 이름이 없으면 "Unknown Game"으로 표시
                }

                // HTML 출력
                out.println("Game: " + gameName + " (App ID: " + appId + ")<br>");
            }
        } else {
            out.println("Error: Response doesn't contain 'response' object.<br>");
        }
    } catch (java.io.IOException e) {
        out.println("Error: API request failed due to network or connection issue.<br>");
        e.printStackTrace();
    } catch (ParseException e) {
        out.println("Error: Failed to parse the API response.<br>");
        e.printStackTrace();
    } catch (Exception e) {
        out.println("Error: An unexpected error occurred.<br>");
        e.printStackTrace();
    }
%>
