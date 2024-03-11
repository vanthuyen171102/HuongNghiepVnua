package vnua.edu.service;

import java.util.List;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.datatype.jsr310.JavaTimeModule;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.multipart.MultipartFile;
import vnua.edu.config.ApiConfig;
import vnua.edu.utils.Utils;
import vnua.edu.model.News;

import javax.servlet.http.HttpServletRequest;

@Service
public class NewsService {
	private final ObjectMapper objectMapper = new ObjectMapper();

	private final ApiConfig apiConfig;

	@Autowired
	public NewsService(ApiConfig apiConfig) {
		this.apiConfig = apiConfig;
	}


	public News getNewsById(String id) {
		try {
			ResponseEntity<String> response = Utils.doGet(apiConfig.getApiUrl() + "/news/" + id, null);
			if (response!=null && response.getStatusCode().is2xxSuccessful()) {
				String jsonString = response.getBody();
				JsonNode rootNode = objectMapper.readTree(jsonString);
				JsonNode dataNode = rootNode.get("data");

				if (dataNode != null && !dataNode.isNull()) {
					objectMapper.registerModule(new JavaTimeModule());
					return objectMapper.treeToValue(dataNode, News.class);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}


	public String fetchNewsData(int page) {
		try {
			ResponseEntity<String> response = Utils.doGet(apiConfig.getApiUrl() + "/news?page=" + page
					, null);
			if (response!=null && response.getStatusCode().is2xxSuccessful()) {
				return response.getBody();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	public ResponseEntity<String> createNews(MultipartFile imageFile, HttpServletRequest request) {

			// Tạo HttpEntity chứa thông tin cần gửi đi
			HttpHeaders headers = new HttpHeaders();
			String token = Utils.extractTokenFromCookie(request);
			if (token != null && !token.isEmpty()) {
				headers.set("Authorization", "Bearer " + token);
			}
			headers.setContentType(MediaType.APPLICATION_FORM_URLENCODED);

			MultiValueMap<String, String> body = new LinkedMultiValueMap<>();
			body.add("title",request.getParameter("title"));
			body.add("description",request.getParameter("description"));
			body.add("content",request.getParameter("content"));
			if(!imageFile.isEmpty()) {
				body.add("image", Utils.uploadImage(imageFile,"jpg", Utils.extractTokenFromCookie(request) ));
			}
			else {
				body.add("image", "resources/default-news.jpg");
			}

			HttpEntity<MultiValueMap<String, String>> requestEntity = new HttpEntity<>(body, headers);

			// Gọi phương thức doPost với các thông tin cần thiết
			ResponseEntity<String> response = Utils.doPost(apiConfig.getApiUrl() + "/news", requestEntity);
			return response;

	}
	
	public ResponseEntity<String> updateNews(String id, MultipartFile imageFile, HttpServletRequest request) {
			// Tạo HttpEntity chứa thông tin cần gửi đi
			HttpHeaders headers = new HttpHeaders();
			String token = Utils.extractTokenFromCookie(request);
			if (token != null && !token.isEmpty()) {
				headers.set("Authorization", "Bearer " + token);
			}
			headers.setContentType(MediaType.APPLICATION_FORM_URLENCODED);


			MultiValueMap<String, String> body = new LinkedMultiValueMap<>();
			body.add("title",request.getParameter("title"));
			body.add("description",request.getParameter("description"));
			body.add("content",request.getParameter("content"));
			if(!imageFile.isEmpty()) {
				body.add("image", Utils.uploadImage(imageFile, "jpg", Utils.extractTokenFromCookie(request)));
			}
			else {
				body.add("image", getNewsById(id).getImage());
			}

			HttpEntity<MultiValueMap<String, String>> requestEntity = new HttpEntity<>(body, headers);
			// Gọi phương thức doPut với các thông tin cần thiết
			return Utils.doPut(apiConfig.getApiUrl() + "/news/" + id , requestEntity);
	}

	public ResponseEntity<String> deleteNews(String id, HttpServletRequest request) {
			HttpHeaders headers = new HttpHeaders();
			String token = Utils.extractTokenFromCookie(request);
			if (token != null && !token.isEmpty()) {
				headers.set("Authorization", "Bearer " + token);
			}
			headers.setContentType(MediaType.APPLICATION_FORM_URLENCODED);
			HttpEntity<MultiValueMap<String, String>> requestEntity = new HttpEntity<>(null, headers);


			return Utils.doDelete(apiConfig.getApiUrl()+ "/news/" + id, requestEntity);

	}



}
