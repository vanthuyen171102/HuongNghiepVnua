package vnua.edu.model;

public class Question {
    private String id;

    private String content;

    private Answer[] answer;

    public Question() {

    }

    public Question(String id, String content, Answer[] answer) {
        this.id = id;
        this.content = content;
        this.answer = answer;
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

    public Answer[] getAnswer() {
        return answer;
    }

    public void setAnswer(Answer[] answer) {
        this.answer = answer;
    }
}
