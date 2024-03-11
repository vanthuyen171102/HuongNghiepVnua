package vnua.edu.controller.admin;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import vnua.edu.model.Field;
import vnua.edu.model.Toast;
import vnua.edu.service.FieldService;

import javax.servlet.http.HttpServletRequest;

@Controller(value = "FieldControllerOfAdmin")
public class FieldController {

    private final ObjectMapper objectMapper = new ObjectMapper();

    @Autowired
    private  FieldService fieldService;

    @GetMapping("/admin/field")
    public ModelAndView Index( @ModelAttribute("toast") Toast toast) {
        ModelAndView mav = new ModelAndView("admin/field/index");
            mav.addObject("toast", toast);
        mav.addObject("fieldList", fieldService.getFieldList());
        return mav;
    }

    @GetMapping("/admin/field/create")
    public ModelAndView Create() {
        ModelAndView mav = new ModelAndView("admin/field/create");
        return mav;
    }

    @PostMapping("admin/field/createField")
    public String createField(HttpServletRequest request,
                              RedirectAttributes redirectAttributes) {
        try {
            ResponseEntity<String> response = fieldService.createField(request);
            if(response != null) {
                if(response.getStatusCode().is2xxSuccessful()) {
                    redirectAttributes.addFlashAttribute("toast", new Toast("Thành công", "success", "Thêm nghành học thành công"));
                }
                else {
                    String jsonString = response.getBody();
                    JsonNode rootNode = objectMapper.readTree(jsonString);
                    redirectAttributes.addFlashAttribute("toast", new Toast("Lỗi", "error", rootNode.get("message").asText()));
                }
            }
            else {
                redirectAttributes.addFlashAttribute("toast", new Toast("Lỗi", "error", "Thêm nghành học không thành công"));
            }
        } catch (Exception e) {
            e.printStackTrace();
            redirectAttributes.addFlashAttribute("toast", new Toast("Lỗi", "error", "Thêm nghành học không thành công"));
        }
        return "redirect:/admin/field";
    }


    @GetMapping("/admin/field/edit/{id}")
    public ModelAndView Edit(@PathVariable String id) {
        ModelAndView mav = new ModelAndView("admin/field/edit");
        Field field = fieldService.getFieldById(id);
        if(field == null) {
            mav.setViewName("admin/NotFound");
        }
        else {
            mav.addObject("field", field);
        }
        return mav;
    }

    @PostMapping("admin/field/updateField/{id}")
    public String updateField(@PathVariable String id, HttpServletRequest request,
                              RedirectAttributes redirectAttributes) {
        try {
            ResponseEntity<String> response = fieldService.updateField(id, request);
            if(response != null) {
                if(response.getStatusCode().is2xxSuccessful()) {
                    redirectAttributes.addFlashAttribute("toast", new Toast("Thành công", "success", "Sửa thông tin nghành học thành công"));
                }
                else {
                    String jsonString = response.getBody();
                    JsonNode rootNode = objectMapper.readTree(jsonString);
                    redirectAttributes.addFlashAttribute("toast", new Toast("Lỗi", "error", rootNode.get("message").asText()));
                }
            }
            else {
                redirectAttributes.addFlashAttribute("toast", new Toast("Lỗi", "error", "Sửa thông tin nghành học không thành công"));
            }
        } catch (Exception e) {
            e.printStackTrace();
            redirectAttributes.addFlashAttribute("toast", new Toast("Lỗi", "error", "Sửa thông tin nghành học không thành công"));
        }
        return "redirect:/admin/field";
    }

    @GetMapping("admin/field/delete/{id}")
    public String deleteField(@PathVariable String id, HttpServletRequest request,
                                    RedirectAttributes redirectAttributes) {
        try {
            ResponseEntity<String> response = fieldService.deleteField(id, request);
            if(response != null) {
                if(response.getStatusCode().is2xxSuccessful()) {
                    redirectAttributes.addFlashAttribute("toast", new Toast("Thành công", "success", "Xóa nghành học không thành công"));
                }
                else {
                    String jsonString = response.getBody();
                    JsonNode rootNode = objectMapper.readTree(jsonString);
                    redirectAttributes.addFlashAttribute("toast", new Toast("Lỗi", "error", rootNode.get("message").asText()));
                }
            }
            else {
                redirectAttributes.addFlashAttribute("toast", new Toast("Lỗi", "error", "Xóa nghành học không thành công"));
            }
        } catch (Exception e) {
            e.printStackTrace();
            redirectAttributes.addFlashAttribute("toast", new Toast("Lỗi", "error", "Xóa nghành học không thành công"));
        }
        return "redirect:/admin/field";
    }
}
