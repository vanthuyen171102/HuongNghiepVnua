package vnua.edu.controller.web;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.datatype.jsr310.JavaTimeModule;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;
import vnua.edu.model.News;
import vnua.edu.service.NewsService;

import java.util.List;

@Controller(value = "HomeControllerOfWeb")
public class HomeController {
	@Autowired
	NewsService newsService;

	private final ObjectMapper objectMapper = new ObjectMapper();


	@GetMapping("/trang-chu")
	public ModelAndView homePage() {
		ModelAndView mav = new ModelAndView("web/home");
		try {
			//Lấy danh sách tin tức
			String jsonString = newsService.fetchNewsData(1);
			JsonNode rootNode = objectMapper.readTree(jsonString);
			JsonNode dataNode = rootNode.get("data");
			if (dataNode != null && !dataNode.isNull()) {
				objectMapper.registerModule(new JavaTimeModule());
				List<News> newsList = objectMapper.readValue(
						dataNode.toString(),
						new TypeReference<>() {
						}
				);
				mav.addObject("newsList", newsList);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}		return mav;
	}
}
