package vnua.edu.service;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import vnua.edu.config.ApiConfig;
import vnua.edu.model.User;
import vnua.edu.utils.Utils;

@Service
public class AuthenticationService {
	private final ObjectMapper objectMapper = new ObjectMapper();

	private final ApiConfig apiConfig;

	@Autowired
	public AuthenticationService(ApiConfig apiConfig) {
		this.apiConfig = apiConfig;
	}

	public ResponseEntity<String> login(String username, String password) {
			HttpHeaders headers = new HttpHeaders();
			headers.setContentType(MediaType.APPLICATION_FORM_URLENCODED);
			MultiValueMap<String, String> body = new LinkedMultiValueMap<>();
			body.add("username", username);
			body.add("password", password);

			HttpEntity<MultiValueMap<String, String>> requestEntity = new HttpEntity<>(body, headers);
			return Utils.doPost(apiConfig.getApiUrl() + "/user/login", requestEntity);
	}



}
