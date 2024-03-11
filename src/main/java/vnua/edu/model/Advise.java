package vnua.edu.model;


import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

public class Advise {
    public String id;
    public byte is_readed;

    public String name;
    public String email;
    public String phone;
    public String content;

    public LocalDateTime create_at;
    public Advise() {}

    public Advise(String id, String name, String email,byte is_readed , String phone, LocalDateTime create_at, String content) {
        this.id = id;
        this.name = name;
        this.is_readed = is_readed;
        this.email = email;
        this.phone = phone;
        this.create_at = create_at;
        this.content = content;
    }

    public Advise(String name, String email, String phone, String content) {
        this.name = name;
        this.email = email;
        this.phone = phone;
        this.content = content;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public byte getIs_readed() {
        return is_readed;
    }

    public void setIs_readed(byte is_readed) {
        this.is_readed = is_readed;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getCreate_at() {
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("d/M/y");
        return create_at.format(formatter);
    }

    public void setCreate_at(LocalDateTime create_at) {
        this.create_at = create_at;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }
}
