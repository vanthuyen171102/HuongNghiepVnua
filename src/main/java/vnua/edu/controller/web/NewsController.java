package vnua.edu.controller.web;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.datatype.jsr310.JavaTimeModule;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import vnua.edu.model.News;
import vnua.edu.service.NewsService;

import java.util.List;

@Controller(value = "NewsControllerOfWeb")
public class NewsController {

	@Autowired
	NewsService newsService;

	private final ObjectMapper objectMapper = new ObjectMapper();

	private final int PAGE_SIZE = 12;

	@GetMapping("/tin-tuc")
	public ModelAndView Index(@RequestParam(name = "page", required = false, defaultValue = "1") int page) {
		ModelAndView mav = new ModelAndView("web/news/index");
		try {
			//Lấy danh sách tin tức
			String jsonString = newsService.fetchNewsData(page);
			JsonNode rootNode = objectMapper.readTree(jsonString);
			JsonNode dataNode = rootNode.get("data");
			if (dataNode != null && !dataNode.isNull()) {
				objectMapper.registerModule(new JavaTimeModule());
				List<News> newsList = objectMapper.readValue(
						dataNode.toString(),
						new TypeReference<>() {
						}
				);
				JsonNode metaNode = rootNode.get("meta");
				int totalPages = (int) Math.ceil((double) metaNode.get("total").asInt() / PAGE_SIZE);
				mav.addObject("newsList", newsList);
				mav.addObject("currentPage", page);
				mav.addObject("totalPages", totalPages);

			}
		} catch (Exception e) {
			e.printStackTrace();
		}		return mav;
	}
	
	@GetMapping("/tin-tuc/{id}")
	public ModelAndView Details(@PathVariable String id) {
		ModelAndView mav = new ModelAndView("web/news/details");
		News news = newsService.getNewsById(id);
		if (news == null)
			mav.setViewName("/web/NotFound");
		else
			mav.addObject("news", news);
		return mav;
	}
}
