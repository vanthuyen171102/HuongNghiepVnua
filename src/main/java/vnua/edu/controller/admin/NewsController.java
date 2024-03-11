package vnua.edu.controller.admin;

import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.Part;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.datatype.jsr310.JavaTimeModule;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import vnua.edu.model.News;
import vnua.edu.model.Toast;
import vnua.edu.service.NewsService;

import java.io.InputStream;
import java.util.List;

@Controller(value = "NewsControllerOfAdmin")
@MultipartConfig
public class NewsController {
    @Autowired
    NewsService newsService;

    private final ObjectMapper objectMapper = new ObjectMapper();

    private final int PAGE_SIZE = 12;

    @GetMapping(value = {"/admin/news", "/admin/news/index"})
    public ModelAndView Index(@RequestParam(name = "page", required = false, defaultValue = "1") int page,
                              @ModelAttribute("toast")Toast toast) {
        ModelAndView mav = new ModelAndView("admin/news/index");
        try {

                mav.addObject("toast", toast);

            //Lấy danh sách tin tức
            String jsonString = newsService.fetchNewsData(page);
            JsonNode rootNode = objectMapper.readTree(jsonString);
            JsonNode dataNode = rootNode.get("data");
            if (dataNode != null) {
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
        }
        return mav;
    }

    @GetMapping("/admin/news/details/{id}")
    public ModelAndView Details(@PathVariable String id) {
        ModelAndView mav = new ModelAndView("admin/news/details");
        mav.addObject("News", newsService.getNewsById(id));
        return mav;
    }

    @GetMapping("/admin/news/create")
    public ModelAndView Create() {
        ModelAndView mav = new ModelAndView("admin/news/create");
        return mav;
    }

    @PostMapping("/admin/news/createNews")
    public String createNews(@RequestParam("image") MultipartFile imageFile,
                             HttpServletRequest request,
                             RedirectAttributes redirectAttributes) {
        try {
            ResponseEntity<String> response = newsService.createNews(imageFile, request);

            if(response!=null) {
                if(response.getStatusCode().is2xxSuccessful()) {
                    redirectAttributes.addFlashAttribute("toast", new Toast("Thành công", "success", "Thêm tin tức thành công"));
                    return "redirect:/admin/news";
                }
                else {
                    String jsonString = response.getBody();
                    JsonNode rootNode = objectMapper.readTree(jsonString);
                    redirectAttributes.addFlashAttribute("toast", new Toast("Lỗi", "error", rootNode.get("message").asText()));
                }
            }
            else {
                redirectAttributes.addFlashAttribute("toast", new Toast("Lỗi", "error", "Thêm tin tức không thành công"));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return "redirect:/admin/news/create";
    }

    @GetMapping("/admin/news/edit/{id}")
    public ModelAndView Edit(@PathVariable String id) {
        ModelAndView mav = new ModelAndView("admin/news/edit");
        News news = newsService.getNewsById(id);
        if (news == null)
            mav.setViewName("/admin/NotFound");
        else
            mav.addObject("news", news);
        return mav;
    }

    @PostMapping("/admin/news/updateNews/{id}")
    public String updateNews(@PathVariable String id, @RequestParam("image") MultipartFile imageFile,
                             HttpServletRequest request,
                             RedirectAttributes redirectAttributes) {
        try {
            ResponseEntity<String> response = newsService.updateNews(id, imageFile, request);
            if(response != null) {
                if(response.getStatusCode().is2xxSuccessful()) {
                    redirectAttributes.addFlashAttribute("toast", new Toast("Thành công", "success", "Sửa tin tức thành công"));
                    return "redirect:/admin/news";
                }
                else {
                    String jsonString = response.getBody();
                    JsonNode rootNode = objectMapper.readTree(jsonString);
                    redirectAttributes.addFlashAttribute("toast", new Toast("Lỗi", "error", rootNode.get("message").asText()));
                }
            }
            else {
                redirectAttributes.addFlashAttribute("toast", new Toast("Lỗi", "error", "Sửa tin tức không thành công"));
            }
        } catch (Exception e) {
            e.printStackTrace();
            redirectAttributes.addFlashAttribute("toast", new Toast("Lỗi", "error", "Sửa tin tức không thành công"));
        }

        return "redirect:/admin/news/edit/" + id;
    }

    @GetMapping("/admin/news/delete/{id}")
    public String deleteNews(@PathVariable String id,
                             RedirectAttributes redirectAttributes, HttpServletRequest request) {
    try {
        ResponseEntity<String> response = newsService.deleteNews(id, request);
        if(response != null) {
            if (response.getStatusCode().is2xxSuccessful()) {
                redirectAttributes.addFlashAttribute("toast", new Toast("Thành công", "success", "Xóa tin tức thành công"));
            }
            else {
                String jsonString = response.getBody();
                JsonNode rootNode = objectMapper.readTree(jsonString);
                redirectAttributes.addFlashAttribute("toast", new Toast("Lỗi", "error", rootNode.get("message").asText()));
            }
        }
        else {
            redirectAttributes.addFlashAttribute("toast", new Toast("Lỗi", "error", "Xóa tin tức không thành công"));
        }
    } catch (Exception e)
    {
        redirectAttributes.addFlashAttribute("toast", new Toast("Lỗi", "error", "Xóa tin tức không thành công"));
    }

        return "redirect:/admin/news/index";
    }
}
