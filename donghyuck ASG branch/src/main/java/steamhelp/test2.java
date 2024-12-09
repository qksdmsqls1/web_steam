import com.google.gson.*;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.util.*;

public class GamesServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String jsonFilePath = getServletContext().getRealPath("/resources/games.json");
        BufferedReader reader = new BufferedReader(new FileReader(jsonFilePath));
        StringBuilder jsonBuilder = new StringBuilder();
        String line;
        
        while ((line = reader.readLine()) != null) {
            jsonBuilder.append(line);
        }
        reader.close();
        
        String jsonData = jsonBuilder.toString();

        // Gson을 사용하여 JSON 데이터 파싱
        JsonObject jsonObject = JsonParser.parseString(jsonData).getAsJsonObject();
        JsonArray gamesArray = jsonObject.getAsJsonObject("response").getAsJsonArray("games");

        List<Game> gamesList = new ArrayList<>();
        
        for (JsonElement gameElement : gamesArray) {
            JsonObject gameObj = gameElement.getAsJsonObject();
            Game game = new Game();
            game.setName(gameObj.get("name").getAsString());
            game.setPlaytime(gameObj.get("playtime_forever").getAsInt());
            game.setImgIconUrl(gameObj.get("img_icon_url").getAsString());
            gamesList.add(game);
        }

        request.setAttribute("gamesList", gamesList);

        // JSP로 포워드
        RequestDispatcher dispatcher = request.getRequestDispatcher("/games.jsp");
        dispatcher.forward(request, response);
    }
}
