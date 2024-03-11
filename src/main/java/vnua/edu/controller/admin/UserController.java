package vnua.edu.controller.admin;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import vnua.edu.model.Toast;
import vnua.edu.model.User;
import vnua.edu.service.UserService;
import vnua.edu.utils.Utils;

import javax.servlet.http.HttpServletRequest;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

@Controller(value = "UserControllerOfAdmin")
public class UserController {
    private final ObjectMapper objectMapper = new ObjectMapper();

    @Autowired
    private UserService userService;

    @GetMapping("/admin/user")
    public ModelAndView Index(@ModelAttribute("toast") Toast toast) {
        ModelAndView mav = new ModelAndView("/admin/user/index");
        mav.addObject("toast", toast);
        return mav;
    }

    @GetMapping("/admin/profile")
    public ModelAndView Profile(HttpServletRequest request) {
        ModelAndView mav = new ModelAndView("/admin/user/profile");
        User user = userService.getUserById(Utils.extractUserIdFromCookie(request));
        if (user == null) {
            mav.setViewName("/admin/NotFound");
        } else {
            mav.addObject("user", user);
        }
        return mav;
    }

    @GetMapping("/admin/change-password")
    public ModelAndView ChangePassword() {
        ModelAndView mav = new ModelAndView("/admin/user/change-password");
        return mav;
    }

    @PostMapping("admin/change-password")
    public String changePassword(HttpServletRequest request, RedirectAttributes redirectAttributes) {
        try {
            ResponseEntity<String> response = userService.changePassword(request);
            if (response != null) {
                if (response.getStatusCode().is2xxSuccessful()) {
                    redirectAttributes.addFlashAttribute("toast", new Toast("Thành công", "success", "Đổi mật khẩu thành công"));
                    return "redirect:/admin/";
                } else {
                    String jsonString = response.getBody();
                    JsonNode rootNode = objectMapper.readTree(jsonString);
                    redirectAttributes.addFlashAttribute("toast", new Toast("Lỗi", "error", rootNode.get("message").asText()));
                }
            } else {
                redirectAttributes.addFlashAttribute("toast", new Toast("Lỗi", "error","Đổi mật khẩu không thành công" ));
            }
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("toast", new Toast("Lỗi", "error","Đổi mật khẩu không thành công" ));
            e.printStackTrace();
        }
        return "redirect:/admin/change-password";
    }

    @GetMapping("/admin/profile/edit")
    public ModelAndView EditProfile(HttpServletRequest request,
                                    @ModelAttribute("toast") Toast toast) {
        ModelAndView mav = new ModelAndView("/admin/user/edit-profile");
        User user = userService.getUserById(Utils.extractUserIdFromCookie(request));
        if (user == null) {
            mav.setViewName("/admin/NotFound");
        } else {
            mav.addObject("user", user);
        }
        mav.addObject("toast", toast);
        return mav;
    }

    @GetMapping("/admin/user/details/{id}")
    public ModelAndView Details(@PathVariable String id) {
        ModelAndView mav = new ModelAndView("/admin/user/details");
        User user = userService.getUserById(id);
        if (user == null) {
            mav.setViewName("/admin/NotFound");
        } else {
            mav.addObject("user", user);
        }
        return mav;
    }

    @GetMapping("/admin/user/create")
    public ModelAndView Create(@ModelAttribute("toast") Toast toast) {
        ModelAndView mav = new ModelAndView("/admin/user/create");
        mav.addObject("toast", toast);
        return mav;
    }

    @PostMapping("/admin/user/createNewUser")
    public String createNewUser(
            HttpServletRequest request,
            RedirectAttributes redirectAttributes) {
        try {
            ResponseEntity<String> response = userService.createNewUser(request);
            if (response != null) {
                if (response.getStatusCode().is2xxSuccessful()) {
                    redirectAttributes.addFlashAttribute("toast", new Toast("Thành công", "success", "Thêm người dùng thành công"));
                    return "redirect:/admin/user";
                } else {
                    String jsonString = response.getBody();
                    JsonNode rootNode = objectMapper.readTree(jsonString);
                    redirectAttributes.addFlashAttribute("toast", new Toast("Lỗi", "error", rootNode.get("message").asText()));
                }
            } else {
                redirectAttributes.addFlashAttribute("toast", new Toast("Lỗi", "error", "Thêm người dùng không thành công"));
            }
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("toast", new Toast("Lỗi", "error", "Thêm người dùng không thành công"));
            e.printStackTrace();
        }
        return "redirect:/admin/user/create";
    }


    @PostMapping("/admin/user/updateUser/{id}")
    public String updateUser(@PathVariable String id, @RequestParam("image") MultipartFile imageFile,
                             HttpServletRequest request,
                             RedirectAttributes redirectAttributes) {
        try {
            User user = userService.getUserById(id);
            if (user == null) {
                return "redirect:/admin/NotFound";
            }
            String name = request.getParameter("name");
            Byte gender = Byte.parseByte(request.getParameter("gender"));
            String phone = request.getParameter("phone");
            LocalDateTime birthDay = null;

            ResponseEntity<String> response = userService.updateUser(id, new User(name, gender, birthDay, phone, user.getAvatar()), imageFile, request);

            if (response != null) {
                if (response.getStatusCode().is2xxSuccessful()) {
                    redirectAttributes.addFlashAttribute("toast", new Toast("Thành công", "success", "Sửa thông tin người dùng thành công"));
                    return "redirect:/admin/user";
                } else {
                    String jsonString = response.getBody();
                    JsonNode rootNode = objectMapper.readTree(jsonString);
                    redirectAttributes.addFlashAttribute("toast", new Toast("Lỗi", "error", rootNode.get("message").asText()));
                }
            } else {
                redirectAttributes.addFlashAttribute("toast", new Toast("Lỗi", "error", "Sửa thông tin người dùng không thành công"));
            }
        } catch (Exception e) {
            e.printStackTrace();
            redirectAttributes.addFlashAttribute("toast", new Toast("Lỗi", "error", "Sửa thông tin người dùng không thành công"));
        }
        return "redirect:/admin/user/edit-profile";
    }

    @GetMapping("/admin/user/deleteUser/{id}")
    public String Delete(@PathVariable String id, HttpServletRequest request, RedirectAttributes redirectAttributes) {
        try {
            ResponseEntity<String> response = userService.deleteUserById(id, request);
            if (response.getStatusCode().is2xxSuccessful()) {
                redirectAttributes.addFlashAttribute("toast", new Toast("Thành công", "success", "Xóa người dùng thành công"));
            } else {
                String jsonString = response.getBody();
                JsonNode rootNode = objectMapper.readTree(jsonString);
                redirectAttributes.addFlashAttribute("toast", new Toast("Lỗi", "error", rootNode.get("message").asText()));
            }
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("toast", new Toast("Lỗi", "error", "Xóa người dùng thành công"));
        }

        return "redirect:/admin/user/index";
    }
}
