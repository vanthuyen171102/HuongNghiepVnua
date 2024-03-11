package vnua.edu.service;

import com.fasterxml.jackson.core.type.TypeReference;
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
import vnua.edu.config.ApiConfig;
import vnua.edu.model.Advise;
import vnua.edu.model.Field;
import vnua.edu.utils.Utils;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Service
public class FieldService {
    private final ApiConfig apiConfig;

    @Autowired
    public FieldService(ApiConfig apiConfig) {
        this.apiConfig = apiConfig;
    }

    private final ObjectMapper objectMapper = new ObjectMapper();


    public Field getFieldById(String id) {
        try {
            ResponseEntity<String> response = Utils.doGet(apiConfig.getApiUrl() + "/field/" + id, null);
            if (response.getStatusCode().is2xxSuccessful()) {
                String jsonString = response.getBody();
                JsonNode rootNode = objectMapper.readTree(jsonString);
                JsonNode dataNode = rootNode.get("data");
                if(dataNode != null) {
                    objectMapper.registerModule(new JavaTimeModule());
                    return objectMapper.treeToValue(dataNode, Field.class);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public List<Field> getFieldList() {
        try {
            ResponseEntity<String> response = Utils.doGet(apiConfig.getApiUrl() + "/field",  null);
            if (response.getStatusCode().is2xxSuccessful()) {
                String jsonString = response.getBody();
                JsonNode rootNode = objectMapper.readTree(jsonString);
                JsonNode dataNode = rootNode.get("data");
                if (!dataNode.isNull()) {
                    return objectMapper.readValue(dataNode.toString(),
                            new TypeReference<>() {
                            });
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public ResponseEntity<String> createField(HttpServletRequest request) {
        HttpHeaders headers = new HttpHeaders();
        String token = Utils.extractTokenFromCookie(request);
        if (token != null && !token.isEmpty()) {
            headers.set("Authorization", "Bearer " + token);
        }

        headers.setContentType(MediaType.APPLICATION_FORM_URLENCODED);

        MultiValueMap<String, String> body = new LinkedMultiValueMap<>();

        body.add("name", request.getParameter("name"));

        HttpEntity<MultiValueMap<String, String>> requestEntity = new HttpEntity<>(body, headers);

        return Utils.doPost(apiConfig.getApiUrl() + "/field/", requestEntity);
    }

    public ResponseEntity<String> updateField(String id, HttpServletRequest request) {
        // Tạo HttpEntity chứa thông tin cần gửi đi
        HttpHeaders headers = new HttpHeaders();
        String token = Utils.extractTokenFromCookie(request);
        if (token != null && !token.isEmpty()) {
            headers.set("Authorization", "Bearer " + token);
        }

        headers.setContentType(MediaType.APPLICATION_FORM_URLENCODED);

        MultiValueMap<String, String> body = new LinkedMultiValueMap<>();

        body.add("name", request.getParameter("name"));

        HttpEntity<MultiValueMap<String, String>> requestEntity = new HttpEntity<>(body, headers);

        return Utils.doPut(apiConfig.getApiUrl() + "/field/" + id, requestEntity);
    }


    public ResponseEntity<String> deleteField(String id, HttpServletRequest request) {
        HttpHeaders headers = new HttpHeaders();
        String token = Utils.extractTokenFromCookie(request);
        if (token != null && !token.isEmpty()) {
            headers.set("Authorization", "Bearer " + token);
        }
        headers.setContentType(MediaType.APPLICATION_FORM_URLENCODED);

        HttpEntity<String> requestEntity = new HttpEntity<>(null, headers);

        return Utils.doDelete(apiConfig.getApiUrl() + "/field/" + id, requestEntity);
    }
}
