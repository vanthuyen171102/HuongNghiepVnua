package vnua.edu.controller.admin;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.datatype.jsr310.JavaTimeModule;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpMethod;
import org.springframework.http.client.HttpComponentsClientHttpRequestFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;
import vnua.edu.model.Advise;
import vnua.edu.model.News;
import vnua.edu.service.AdviseService;

import java.util.Comparator;
import java.util.List;


@Controller(value = "AdviseControllerOfAdmin")
public class AdviseController {

    @Autowired
    AdviseService adviseService;

    private final ObjectMapper objectMapper = new ObjectMapper();

    private final int PAGE_SIZE = 12;

    @GetMapping("/admin/advise")
    public ModelAndView Index(@RequestParam(value = "page", required = false, defaultValue = "1") int page) {
        ModelAndView mav = new ModelAndView("admin/advise/index");

        try {
            String jsonString = adviseService.fetchAdviseData(page);
            JsonNode rootNode = objectMapper.readTree(jsonString);
            JsonNode dataNode = rootNode.get("data");
            if(dataNode != null) {
                objectMapper.registerModule(new JavaTimeModule());
                List<Advise> adviseList = objectMapper.readValue(
                        dataNode.toString(),
                        new TypeReference<>() {
                        }
                );
                adviseList.sort(Comparator.comparing(Advise::getIs_readed).thenComparing(Advise::getCreate_at));
                JsonNode metaNode = rootNode.get("meta");
                int totalPages = (int) Math.ceil((double) metaNode.get("total").asInt() / PAGE_SIZE);
                mav.addObject("adviseList", adviseList);
                mav.addObject("currentPage", page);
                mav.addObject("totalPages", totalPages);

            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return mav;
    }

    @GetMapping("/admin/advise/{id}")
    public ModelAndView Details(@PathVariable String id) {
        ModelAndView mav = new ModelAndView("admin/advise/details");
        Advise advise = adviseService.getAdviseById(id);
        if (advise == null)
            mav.setViewName("/admin/NotFound");
        else
            mav.addObject("advise", advise);
        return mav;
    }
   
}
