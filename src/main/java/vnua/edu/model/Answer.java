package vnua.edu.model;

public class Answer {
    private String id;
    private String content;

    private int most;

    private int least;

    public Answer() {

    }

    public Answer(String id, String content, int most, int least) {
        this.id = id;
        this.content = content;
        this.most = most;
        this.least = least;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public int getMost() {
        return most;
    }

    public void setMost(int most) {
        this.most = most;
    }

    public int getLeast() {
        return least;
    }

    public void setLeast(int least) {
        this.least = least;
    }
}
