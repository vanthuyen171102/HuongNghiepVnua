package vnua.edu.service;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import vnua.edu.config.ApiConfig;
import vnua.edu.model.Answer;
import vnua.edu.model.Question;
import vnua.edu.utils.Utils;

import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.net.http.HttpResponse;
import java.nio.charset.Charset;
import java.nio.charset.StandardCharsets;
import java.util.List;


@Service
public class PackageService {
    private final ObjectMapper objectMapper = new ObjectMapper();

    private final ApiConfig apiConfig;

    @Autowired
    public PackageService(ApiConfig apiConfig) {
        this.apiConfig = apiConfig;
    }

    private final String DISC_ID = "74c8329e-85e7-11ee-b0fc-089798d3";

    public List<Question> getDISCPackage() {
        try {

            ResponseEntity<String> response = Utils.doGet(apiConfig.getApiUrl() + "/package/"+ DISC_ID, null);
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

    public String getDiscTestResult(String answerJson) {
        try {
            HttpHeaders headers = new HttpHeaders();
            headers.setContentType(MediaType.APPLICATION_JSON_UTF8);
            HttpEntity<String> requestEntity = new HttpEntity<>(answerJson, headers);
            ResponseEntity<String> response = Utils.doPost(apiConfig.getApiUrl() + "/package/"+ DISC_ID, requestEntity);
            if(response.getStatusCode().is2xxSuccessful()) {
                return response.getBody();
            }
        } catch(Exception e) {
            e.printStackTrace();
        }
        return null;
    }
}
