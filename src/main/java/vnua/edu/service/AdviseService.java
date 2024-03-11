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
import vnua.edu.config.ApiConfig;
import vnua.edu.model.Advise;
import vnua.edu.model.News;
import vnua.edu.utils.Utils;

import javax.servlet.http.HttpServletRequest;

@Service
public class AdviseService {

    private final ApiConfig apiConfig;

    @Autowired
    public AdviseService(ApiConfig apiConfig) {
        this.apiConfig = apiConfig;
    }

    private final ObjectMapper objectMapper = new ObjectMapper();

    public Advise getAdviseById(String id) {
        try {
            ResponseEntity<String> response = Utils.doGet(apiConfig.getApiUrl() + "/advise/" + id, null);
            if (response.getStatusCode().is2xxSuccessful()) {
                String jsonString = response.getBody();
                JsonNode rootNode = objectMapper.readTree(jsonString);
                JsonNode dataNode = rootNode.get("data");
                if(dataNode != null) {
                    objectMapper.registerModule(new JavaTimeModule());
                    return objectMapper.treeToValue(dataNode, Advise.class);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public String fetchAdviseData(int page) {
        try {
            ResponseEntity<String> response = Utils.doGet(apiConfig.getApiUrl() + "/advise?page=" + page
                    , null);
            if (response.getStatusCode().is2xxSuccessful()) {
                return response.getBody();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public boolean createAdvise(Advise advise) {
            try {
                // Tạo HttpEntity chứa thông tin cần gửi đi
                HttpHeaders headers = new HttpHeaders();
                headers.setContentType(MediaType.APPLICATION_FORM_URLENCODED);

                MultiValueMap<String, String> body = new LinkedMultiValueMap<>();
                body.add("name", advise.getName());
                body.add("email", advise.getEmail());
                body.add("content", advise.getContent());
                body.add("phone", advise.getPhone());
                HttpEntity<MultiValueMap<String, String>> requestEntity = new HttpEntity<>(body, headers);
                // Gọi phương thức doPost với các thông tin cần thiết
                ResponseEntity<String> response = Utils.doPost(apiConfig.getApiUrl() + "/advise", requestEntity);
                if (response.getStatusCode().is2xxSuccessful()) {
                    return true;
                }
            } catch (Exception e) {
                e.printStackTrace();
                return false;
            }
            return false;
        }

}
