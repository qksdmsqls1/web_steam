<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="steamhelp.Game" %> <!-- Game 클래스를 임포트 -->
<%@ page import="java.util.List" %> <!-- List 클래스를 임포트 -->

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
                <th>무료 게임 여부</th>
                <th>게임 이미지</th>
            </tr>
        </thead>
        <tbody>
            <%
                
                List<Game> gameList = (List<Game>) session.getAttribute("gameList");

                // gameList가 null이 아닌 경우, 리스트의 각 게임에 대해 반복
                if (gameList != null && !gameList.isEmpty()) {
                    for (Game game : gameList) {
            %>
            <tr>
                <td><%= game.getName() %></td>
                <td><%= game.getPlaytime() %> 분</td>
                <td><%= game.getFreeStatus() %></td>
                <td>
                    <% if (game.getImageUrl() != null) { %>
                        <img src="<%= game.getImageUrl() %>" alt="게임 이미지" width="100">
                    <% } else { %>
                        이미지 없음
                    <% } %>
                </td>
            </tr>
            <%
                    }
                } else {
                    out.println("게임 목록이 없습니다.");
                }
            %>
        </tbody>
    </table>
</body>
</html>
