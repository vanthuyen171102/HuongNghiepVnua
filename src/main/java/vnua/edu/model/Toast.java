package vnua.edu.model;

public class Toast {
    private String title;
    private String type;
    private String message;

    public Toast() {

    }

    public Toast(String title, String type, String message) {
        this.title = title;
        this.type = type;
        this.message = message;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }
}
