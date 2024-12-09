package steamhelp;

public class Game {
    private String name;
    private Long playtime;
    private String freeStatus;
    private String imageUrl;

    public Game(String name, Long playtime, String freeStatus, String imageUrl) {
        this.name = name;
        this.playtime = playtime;
        this.freeStatus = freeStatus;
        this.imageUrl = imageUrl;
    }

    // Getter 및 Setter 메서드
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Long getPlaytime() {
        return playtime;
    }

    public void setPlaytime(Long playtime) {
        this.playtime = playtime;
    }

    public String getFreeStatus() {
        return freeStatus;
    }

    public void setFreeStatus(String freeStatus) {
        this.freeStatus = freeStatus;
    }

    public String getImageUrl() {
        return imageUrl;
    }

    public void setImageUrl(String imageUrl) {
        this.imageUrl = imageUrl;
    }
}
