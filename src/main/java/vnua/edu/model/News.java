package vnua.edu.model;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

public class News {


    public static final String API_URL = "http://localhost:3000";

    private String id;
    private String title;
    private String user_id;
    private String image;
    private String content;
    private String description;
    private String author;
    private LocalDateTime publish_date;
    private LocalDateTime create_at;
    private LocalDateTime update_at;

    public News() {

    }

    public News(String id, String title, String user_id, String image, String content, String description, String author,
                LocalDateTime publish_date, LocalDateTime create_at, LocalDateTime update_at) {
        this.id = id;
        this.title = title;
        this.user_id = user_id;
        this.image = image;
        this.content = content;
        this.description = description;
        this.author = author;
        this.publish_date = publish_date;
        this.create_at = create_at;
        this.update_at = update_at;
    }



    public News(String title, String description, String content) {
        this.title = title;
        this.description = description;
        this.content = content;
    }

    public News(String id, String title, String image, String description) {
        super();
        this.id = id;
        this.title = title;
        this.image = image;
        this.description = description;
    }



    @Override
    public String toString() {
        return "News [id=" + id + ", title=" + title + ", image=" + image + ", content=" + content
                + ", description=" + description + ", author=" + author + ", publish_date=" + publish_date
                + ", created_at=" + create_at + ", update_at=" + update_at + "]";
    }

    public void setUpdate_at(LocalDateTime update_at) {
        this.update_at = update_at;
    }

    public void setCreate_at(LocalDateTime created_at) {
        this.create_at = created_at;
    }


    public String getId() {
        return id;
    }

    public String getTitle() {
        if (title == "")
            title = "Tiêu đề không xác định";
        return title;
    }

    public String getImage() {
        if (image.isEmpty())
            image = "resources/default-news.jpg";
        return image;
    }

    public String getImageSrc() {
        if (image.isEmpty())
            image = "resources/default-news.jpg";
        return API_URL + "/" + image;
    }

    public String getUser_id() {
        return user_id;
    }


    public String getContent() {
        if(content == null || content.isEmpty())
            return "";
        return content;
    }

    public String getDescription() {
        return description;
    }

    public String getAuthor() {
        return author;
    }

    public LocalDateTime getPublish_date() {
        return publish_date;
    }

    public LocalDateTime getCreate_at() {
        return create_at;
    }

    public LocalDateTime getUpdate_at() {
        return update_at;
    }

    public String getDate(LocalDateTime date) {
        // Định dạng ban đầu của chuỗi ngày-giờ
        DateTimeFormatter inputFormatter = DateTimeFormatter.ISO_LOCAL_DATE_TIME;

        // Định dạng mới mong muốn
        DateTimeFormatter outputFormatter = DateTimeFormatter.ofPattern("dd-MM-yyyy");

        // Chuyển đổi từ chuỗi sang LocalDateTime
        LocalDateTime dateTime = LocalDateTime.parse(date.toString(), inputFormatter);

        // Chuyển đổi từ LocalDateTime sang chuỗi định dạng mới
        String outputDate = dateTime.format(outputFormatter);

        return outputDate;
    }
}
