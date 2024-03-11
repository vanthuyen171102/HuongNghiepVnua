package vnua.edu.model;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

public class User {

	public static final String API_URL = "http://localhost:3000";

	private String id;
	private String name;

	private byte gender;

	private LocalDateTime birth_day;

	private String phone;

	private String email;

	private LocalDateTime create_at;

	private LocalDateTime update_at;

	private int permission;
	private String avatar;
	private String token;

	public User() {

	}

	public User(String id, String name, int permission, String avatar, String token) {
		this.id = id;
		this.name = name;
		this.permission = permission;
		this.avatar = avatar;
		this.token = token;
	}

	public User(String name, byte gender, LocalDateTime birth_day, String phone, String avatar) {
		this.name = name;
		this.gender = gender;
		this.birth_day = birth_day;
		this.phone = phone;
		this.avatar = avatar;
	}



	public User(String id, String name, byte gender, LocalDateTime birth_day, String phone, String email, LocalDateTime create_at, LocalDateTime update_at, int permission, String avatar, String token) {
		this.id = id;
		this.name = name;
		this.gender = gender;
		this.birth_day = birth_day;
		this.phone = phone;
		this.email = email;
		this.create_at = create_at;
		this.update_at = update_at;
		this.permission = permission;
		this.avatar = avatar;
		this.token = token;
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

	public byte getGender() {
		return gender;
	}

	public void setGender(byte gender) {
		this.gender = gender;
	}

	public LocalDateTime getBirth_day() {
		return birth_day;
	}

//	public String getBirth_dayString() {
//		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-dd-MM");
//		return birth_day.format(formatter);
//	}

	public void setBirth_day(LocalDateTime birth_day) {
		this.birth_day = birth_day;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public LocalDateTime getCreate_at() {
		return create_at;
	}

	public void setCreate_at(LocalDateTime create_at) {
		this.create_at = create_at;
	}

	public LocalDateTime getUpdate_at() {
		return update_at;
	}

	public void setUpdate_at(LocalDateTime update_at) {
		this.update_at = update_at;
	}

	public int getPermission() {
		return permission;
	}

	public void setPermission(int permission) {
		this.permission = permission;
	}

	public String getAvatar() {
		return avatar;
	}

	public String getAvatarSrc() {
		if(avatar== null || avatar.isEmpty())
			return API_URL + "/resources/default-avatar.png";
		return API_URL + "/" + avatar;
	}

	public void setAvatar(String avatar) {
		this.avatar = avatar;
	}

	public String getToken() {
		return token;
	}

	public void setToken(String token) {
		this.token = token;
	}
}
