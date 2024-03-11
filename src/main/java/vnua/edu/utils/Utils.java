package vnua.edu.utils;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.FileSystemResource;
import org.springframework.http.*;
import org.springframework.http.client.HttpComponentsClientHttpRequestFactory;
import org.springframework.http.converter.StringHttpMessageConverter;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.HttpClientErrorException;
import org.springframework.web.client.HttpServerErrorException;
import org.springframework.web.client.HttpStatusCodeException;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.multipart.MultipartFile;
import vnua.edu.config.ApiConfig;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.nio.charset.StandardCharsets;

@Service
public class Utils {

    private static ApiConfig apiConfig;

    @Autowired
    public Utils(ApiConfig apiConfig) {
        this.apiConfig = apiConfig;
    }


    public static ResponseEntity<String> doGet(String url, HttpEntity<?> entity) throws Exception {
        try {
            RestTemplate restTemplate = new RestTemplate();
            restTemplate.setRequestFactory(new HttpComponentsClientHttpRequestFactory());
            return restTemplate.exchange(
                    url,
                    HttpMethod.GET,
                    entity,
                    String.class);
        } catch (HttpClientErrorException | HttpServerErrorException e) {
            return ResponseEntity.status(e.getRawStatusCode()).headers(e.getResponseHeaders())
                    .body(e.getResponseBodyAsString());
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public static ResponseEntity<String> doPost(String url, HttpEntity<?> entity) {
       try {
            RestTemplate restTemplate = new RestTemplate();
           restTemplate.setRequestFactory(new HttpComponentsClientHttpRequestFactory());
            return restTemplate.exchange(
                    url,
                    HttpMethod.POST,
                    entity,
                    String.class);
        } catch (HttpClientErrorException | HttpServerErrorException e) {
           return ResponseEntity.status(e.getRawStatusCode()).headers(e.getResponseHeaders())
                   .body(e.getResponseBodyAsString());
       } catch (Exception e) {
            e.printStackTrace();
           return null;
        }
    }

    public static ResponseEntity<String> doPut(String url, HttpEntity<?> entity) {
        try {
            RestTemplate restTemplate = new RestTemplate();
            restTemplate.setRequestFactory(new HttpComponentsClientHttpRequestFactory());
            return restTemplate.exchange(
                    url,
                    HttpMethod.PUT,
                    entity,
                    String.class);
        } catch (HttpClientErrorException | HttpServerErrorException e) {
            return ResponseEntity.status(e.getRawStatusCode()).headers(e.getResponseHeaders())
                    .body(e.getResponseBodyAsString());
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public static ResponseEntity<String> doDelete(String url, HttpEntity<?> entity) {
        try {
            RestTemplate restTemplate = new RestTemplate();
            restTemplate.setRequestFactory(new HttpComponentsClientHttpRequestFactory());
            return restTemplate.exchange(
                    url,
                    HttpMethod.DELETE,
                    entity,
                    String.class);
        } catch (HttpClientErrorException | HttpServerErrorException e) {
            return ResponseEntity.status(e.getRawStatusCode()).headers(e.getResponseHeaders())
                    .body(e.getResponseBodyAsString());
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public static String uploadImage(MultipartFile imageFile, String extension, String token) {
        try {
            RestTemplate restTemplate = new RestTemplate();

            // Tạo một file tạm thời để lưu trữ dữ liệu từ MultipartFile
            File tempFile = File.createTempFile("temp", "." + extension);
            imageFile.transferTo(tempFile); // Ghi dữ liệu từ MultipartFile vào file tạm thời

            // Tạo headers cho yêu cầu
            HttpHeaders headers = new HttpHeaders();
            headers.setContentType(MediaType.MULTIPART_FORM_DATA);
            if (token != null && !token.isEmpty()) {
                headers.set("Authorization", "Bearer " + token);
            }

            // Tạo một đối tượng MultiValueMap để chứa dữ liệu form
            MultiValueMap<String, Object> body = new LinkedMultiValueMap<>();
            body.add("image", new FileSystemResource(tempFile));

            // Tạo đối tượng HttpEntity chứa headers và body
            HttpEntity<MultiValueMap<String, Object>> requestEntity = new HttpEntity<>(body, headers);

            // Gửi yêu cầu POST lên API với dữ liệu form (tập tin)
            ResponseEntity<String> response = restTemplate.exchange(
                    apiConfig.getApiUrl() + "/image/single",
                    HttpMethod.POST,
                    requestEntity,
                    String.class
            );

            // Xử lý phản hồi từ server
            if (response.getStatusCode().is2xxSuccessful()) {
                ObjectMapper objectMapper = new ObjectMapper();
                String jsonString = response.getBody();
                JsonNode rootNode = objectMapper.readTree(jsonString);
                JsonNode imageUrl = rootNode.get("image");
                if (imageUrl != null && !imageUrl.isNull()) {
                    return objectMapper.treeToValue(imageUrl, String.class);
                }
            } else {
                return "resources/default.jpg";
            }
        } catch (Exception e) {
            return "resources/default.jpg";
        }
        return "resources/default.jpg";
    }



    public static String extractTokenFromCookie(HttpServletRequest request) {
        Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if ("token".equals(cookie.getName())) {
                    return cookie.getValue();
                }
            }
        }

        return null;
    }

    public static String extractUserIdFromCookie(HttpServletRequest request) {
        Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if ("user_id".equals(cookie.getName())) {
                    return cookie.getValue();
                }
            }
        }
        return null;
    }


}
