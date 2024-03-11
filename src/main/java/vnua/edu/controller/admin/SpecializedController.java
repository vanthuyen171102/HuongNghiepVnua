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
import vnua.edu.model.Specialized;
import vnua.edu.model.Toast;
import vnua.edu.service.FieldService;
import vnua.edu.service.SpecializedService;

import javax.servlet.http.HttpServletRequest;

@Controller(value = "SpecializedControllerOfAdmin")
public class SpecializedController {
    private final ObjectMapper objectMapper = new ObjectMapper();

    @Autowired
    private SpecializedService specializedService;

    @Autowired
    private FieldService fieldService;

    @GetMapping("/admin/specialized")
    public ModelAndView Index( @ModelAttribute("toast") Toast toast) {
        ModelAndView mav = new ModelAndView("admin/specialized/index");
            mav.addObject("toast", toast);
        mav.addObject("fieldList", fieldService.getFieldList());
        return mav;
    }

    @GetMapping("/admin/specialized/create")
    public ModelAndView Create() {
        ModelAndView mav = new ModelAndView("admin/specialized/create");
        mav.addObject("fieldList", fieldService.getFieldList());
        return mav;
    }

    @PostMapping("admin/specialized/createSpecialized")
    public String createField(HttpServletRequest request,
                              RedirectAttributes redirectAttributes) {
        try {
            ResponseEntity<String> response = specializedService.createSpecialized(request);
            if(response != null) {
                if(response.getStatusCode().is2xxSuccessful()) {
                    redirectAttributes.addFlashAttribute("toast", new Toast("Thành công", "success", "Thêm chuyên nghành thành công"));
                }
                else {
                    String jsonString = response.getBody();
                    JsonNode rootNode = objectMapper.readTree(jsonString);
                    redirectAttributes.addFlashAttribute("toast", new Toast("Lỗi", "error", rootNode.get("message").asText()));
                }
            }
            else {
                redirectAttributes.addFlashAttribute("toast", new Toast("Lỗi", "error", "Thêm chuyên nghành không thành công"));
            }
        } catch (Exception e) {
            e.printStackTrace();
            redirectAttributes.addFlashAttribute("toast", new Toast("Lỗi", "error", "Thêm chuyên nghành không thành công"));
        }
        return "redirect:/admin/specialized";
    }

    @GetMapping("/admin/specialized/edit/{id}")
    public ModelAndView Edit(@PathVariable String id) {
        ModelAndView mav = new ModelAndView("admin/specialized/edit");
        Specialized specialized = specializedService.getSpecializedById(id);
        if(specialized == null) {
            mav.setViewName("admin/NotFound");
        }
        else {
            mav.addObject("specialized", specialized);
            mav.addObject("fieldList", fieldService.getFieldList());
        }
        return mav;
    }

    @PostMapping("admin/specialized/updateSpecialized/{id}")
    public String updateSpecialized(@PathVariable String id,HttpServletRequest request,
                         RedirectAttributes redirectAttributes) {
        try {
            ResponseEntity<String> response = specializedService.updateSpecialized(id, request);
            if(response != null) {
                if(response.getStatusCode().is2xxSuccessful()) {
                    redirectAttributes.addFlashAttribute("toast", new Toast("Thành công", "success", "Sửa thông tin chuyên nghành thành công"));
                }
                else {
                    String jsonString = response.getBody();
                    JsonNode rootNode = objectMapper.readTree(jsonString);
                    redirectAttributes.addFlashAttribute("toast", new Toast("Lỗi", "error", rootNode.get("message").asText()));
                }
            }
            else {
                redirectAttributes.addFlashAttribute("toast", new Toast("Lỗi", "error", "Sửa thông tin chuyên nghành không thành công"));
            }
        } catch (Exception e) {
            e.printStackTrace();
            redirectAttributes.addFlashAttribute("toast", new Toast("Lỗi", "error", "Sửa thông tin chuyên nghành không thành công"));
        }
        return "redirect:/admin/specialized";
    }

    @GetMapping("admin/specialized/delete/{id}")
    public String deleteSpecialized(@PathVariable String id, HttpServletRequest request,
                         RedirectAttributes redirectAttributes) {
        try {
            ResponseEntity<String> response = specializedService.deleteSpecialized(id, request);
            if(response != null) {
                if(response.getStatusCode().is2xxSuccessful()) {
                    redirectAttributes.addFlashAttribute("toast", new Toast("Thành công", "success", "Xóa chuyên nghành thành công"));
                }
                else {
                    String jsonString = response.getBody();
                    JsonNode rootNode = objectMapper.readTree(jsonString);
                    redirectAttributes.addFlashAttribute("toast", new Toast("Lỗi", "error", rootNode.get("message").asText()));
                }
            }
            else {
                redirectAttributes.addFlashAttribute("toast", new Toast("Lỗi", "error", "Xóa chuyên nghành không thành công"));
            }
        } catch (Exception e) {
            e.printStackTrace();
            redirectAttributes.addFlashAttribute("toast", new Toast("Lỗi", "error", "Xóa chuyên nghành không thành công"));
        }
        return "redirect:/admin/specialized";
    }
}
