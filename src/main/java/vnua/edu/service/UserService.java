package vnua.edu.service;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.datatype.jsr310.JavaTimeModule;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.multipart.MultipartFile;
import vnua.edu.config.ApiConfig;
import vnua.edu.model.News;
import vnua.edu.model.User;
import vnua.edu.utils.Utils;

import javax.servlet.http.HttpServletRequest;
import java.nio.charset.StandardCharsets;
import java.time.format.DateTimeFormatter;
import java.util.List;

@Service
public class UserService {

    private final ObjectMapper objectMapper = new ObjectMapper();

    private final ApiConfig apiConfig;

    @Autowired
    public UserService(ApiConfig apiConfig) {
        this.apiConfig = apiConfig;
    }

    public List<User> getAllUser() {
        return null;
    }

    public User getUserById(String id) {
        try {
            ResponseEntity<String> response = Utils.doGet(apiConfig.getApiUrl() + "/user/" + id, null);
            if (response != null && response.getStatusCode().is2xxSuccessful()) {
                String jsonString = response.getBody();
                JsonNode rootNode = objectMapper.readTree(jsonString);
                JsonNode dataNode = rootNode.get("data");

                if (dataNode != null && !dataNode.isNull()) {
                    objectMapper.registerModule(new JavaTimeModule());
                    return objectMapper.treeToValue(dataNode, User.class);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public ResponseEntity<String> createNewUser(HttpServletRequest request) {
        // Tạo HttpEntity chứa thông tin cần gửi đi
        HttpHeaders headers = new HttpHeaders();
        String token = Utils.extractTokenFromCookie(request);
        if (token != null && !token.isEmpty()) {
            headers.set("Authorization", "Bearer " + token);
        }
        headers.setContentType(MediaType.APPLICATION_FORM_URLENCODED);

        MultiValueMap<String, String> body = new LinkedMultiValueMap<>();

        body.add("name", request.getParameter("name"));
        body.add("email", request.getParameter("email"));
        body.add("username", request.getParameter("username"));
        body.add("password", request.getParameter("password"));

        byte permission = Byte.parseByte(request.getParameter("permission"));
        String uri;
        if (permission == 1) {
            uri = "/user/register/admin";
        } else if (permission == 2) {
            uri = "/user/register/volunteers";
        } else {
            return null;
        }
        HttpEntity<MultiValueMap<String, String>> requestEntity = new HttpEntity<>(body, headers);
        // Gọi phương thức doPut với các thông tin cần thiết
        return Utils.doPost(apiConfig.getApiUrl() + uri, requestEntity);
    }

    public ResponseEntity<String> updateUser(String id, User user, MultipartFile imageFile, HttpServletRequest request) {
        // Tạo HttpEntity chứa thông tin cần gửi đi
        HttpHeaders headers = new HttpHeaders();
        String token = Utils.extractTokenFromCookie(request);
        if (token != null && !token.isEmpty()) {
            headers.set("Authorization", "Bearer " + token);
        }
        headers.setContentType(MediaType.APPLICATION_FORM_URLENCODED);


        MultiValueMap<String, String> body = new LinkedMultiValueMap<>();
        body.add("name", user.getName());
        body.add("phone", user.getPhone());
        body.add("gender", String.valueOf(user.getGender()));
        if (!imageFile.isEmpty()) {
            body.add("avatar", Utils.uploadImage(imageFile, "jpg", Utils.extractTokenFromCookie(request)));
        } else {
            body.add("avatar", user.getAvatar());
        }

        HttpEntity<MultiValueMap<String, String>> requestEntity = new HttpEntity<>(body, headers);
        // Gọi phương thức doPut với các thông tin cần thiết
        return Utils.doPut(apiConfig.getApiUrl() + "/user/" + id, requestEntity);
    }

    public ResponseEntity<String> changePassword(HttpServletRequest request) {
        // Tạo HttpEntity chứa thông tin cần gửi đi
        HttpHeaders headers = new HttpHeaders();
        String token = Utils.extractTokenFromCookie(request);
        if (token != null && !token.isEmpty()) {
            headers.set("Authorization", "Bearer " + token);
        }
        headers.setContentType(MediaType.APPLICATION_FORM_URLENCODED);

        MultiValueMap<String, String> body = new LinkedMultiValueMap<>();
        body.add("oldPassword", request.getParameter("old-password"));
        body.add("password", request.getParameter("new-password"));

        HttpEntity<MultiValueMap<String, String>> requestEntity = new HttpEntity<>(body, headers);
        // Gọi phương thức doPut với các thông tin cần thiết
        return Utils.doPut(apiConfig.getApiUrl() + "/user/change_password/" + Utils.extractUserIdFromCookie(request), requestEntity);
    }

    public ResponseEntity<String> deleteUserById(String id, HttpServletRequest request) {
        HttpHeaders headers = new HttpHeaders();
        String token = Utils.extractTokenFromCookie(request);
        if (token != null && !token.isEmpty()) {
            headers.set("Authorization", "Bearer " + token);
        }
        headers.setContentType(MediaType.APPLICATION_FORM_URLENCODED);
        HttpEntity<MultiValueMap<String, String>> requestEntity = new HttpEntity<>(null, headers);


        return Utils.doDelete(apiConfig.getApiUrl() + "/news/" + id, requestEntity);

    }
}
