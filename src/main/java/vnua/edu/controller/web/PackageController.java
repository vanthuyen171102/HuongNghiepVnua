package vnua.edu.controller.web;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.apache.http.HttpResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.servlet.ModelAndView;
import vnua.edu.model.Field;
import vnua.edu.model.News;
import vnua.edu.service.PackageService;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller(value = "PackageControllerOfWeb")
public class PackageController {

    @Autowired
    private PackageService packageService;

    private final ObjectMapper objectMapper = new ObjectMapper();

    @GetMapping("/trac-nghiem-huong-nghiep")
    public ModelAndView Index() {
        ModelAndView mav = new ModelAndView("/web/quiz/index");
        return mav;
    }


    @GetMapping("/trac-nghiem-huong-nghiep/disc")
    public ModelAndView DiscTest() {
        ModelAndView mav = new ModelAndView("/web/quiz/disc");
        mav.addObject("questionList", packageService.getDISCPackage());
        return mav;
    }

    @PostMapping("/quiz/getDiscResult")
    public ResponseEntity<String> getDiscResult(@RequestBody String answer) {
        try {
            String jsonString = packageService.getDiscTestResult(answer);
            if (jsonString != null && !jsonString.isEmpty()) {
                JsonNode rootNode = objectMapper.readTree(jsonString);
                JsonNode dataNode = rootNode.get("data");
                JsonNode resultNode = dataNode.get("result");
                StringBuilder result = new StringBuilder(resultNode.get("content").asText());
                result.append("<h5 class=\"fw-bolder\">Những nghành học phù hợp với bạn</h5>\n" + "                    <div class=\"field-grid\">");
                JsonNode fieldNode = dataNode.get("field");
                List<Field> fieldList = objectMapper.readValue(fieldNode.toString(), new TypeReference<>() {
                });

                for (Field field : fieldList) {
                    String fieldHtml = String.format("<a href=\"/nghanh-hoc/%s\" class=\"field-item\">%s</a>\n", field.getId(), field.getName());
                    result.append(fieldHtml);
                }
                result.append("</div>");
                return ResponseEntity.ok()
                        .contentType(MediaType.APPLICATION_JSON_UTF8)
                        .body(result.toString());
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return (ResponseEntity<String>) ResponseEntity.badRequest();
    }
}
