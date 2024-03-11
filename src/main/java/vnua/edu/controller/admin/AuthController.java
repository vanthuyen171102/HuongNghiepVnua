package vnua.edu.controller.admin;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fasterxml.jackson.datatype.jsr310.JavaTimeModule;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

import vnua.edu.model.Toast;
import vnua.edu.model.User;
import vnua.edu.service.AuthenticationService;

@Controller(value = "AuthControllerOfAdmin")
public class AuthController {

    @Autowired
    AuthenticationService authService;

    @GetMapping(value = "/admin/login")
    public ModelAndView loginPage(@RequestParam(value = "returnUrl", required = false) String returnUrl,
                                  @ModelAttribute("toast") Toast toast) {
        ModelAndView mav = new ModelAndView("admin/login");
        mav.addObject("toast", toast);

        if (returnUrl != null && !returnUrl.isEmpty())
            mav.addObject("returnUrl", returnUrl);

        return mav;
    }

    @PostMapping(value = "/admin/login")
    public String login(HttpServletRequest request, HttpServletResponse response,
                        RedirectAttributes redirectAttributes) {
        try {
            ResponseEntity<String> apiResponse = authService.login(request.getParameter("username"), request.getParameter("password"));
            if(apiResponse != null) {
                ObjectMapper objectMapper = new ObjectMapper();
                objectMapper.registerModule(new JavaTimeModule());
                JsonNode rootNode = objectMapper.readTree(apiResponse.getBody());
                if(apiResponse.getStatusCode().is2xxSuccessful()) {
                    JsonNode dataNode = rootNode.get("data");
                    String token = dataNode.path("token").asText();
                    String user_id = dataNode.path("id").asText();
                    // Thêm giá trị token, userid vào cookie
                    Cookie tokenCookie = new Cookie("token", token);

                    Cookie userCookie = new Cookie("user_id", user_id);
                    response.addCookie(tokenCookie);
                    response.addCookie(userCookie);
                    redirectAttributes.addFlashAttribute("toast", new Toast("Thành công", "success", "Đăng nhập  thành công"));

                    String returnUrl = request.getParameter("returnUrl");
                    if (returnUrl != null && !returnUrl.isEmpty()) {
                        // Nếu returnUrl tồn tại, điều hướng đến returnUrl
                        return "redirect:" + returnUrl;
                    } else {
                        return "redirect:/admin/news/index";
                    }
                }
                else {
                    redirectAttributes.addFlashAttribute("toast", new Toast("Lỗi", "error", rootNode.get("message").asText()));
                }
            }
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("toast", new Toast("Lỗi", "error", "Đăng nhập không thành công"));
            e.printStackTrace();
        }
        return "redirect:/admin/login";
    }

    @GetMapping(value = "/admin/logout")
    public String logout(HttpServletRequest request,HttpServletResponse response,
                         RedirectAttributes redirectAttributes
                         ) {
        try {
            Cookie[] cookies = request.getCookies(); // Lấy tất cả các cookie từ request
            if (cookies != null) {
                for (Cookie cookie : cookies) {
                    if (cookie.getName().equals("user_id") || cookie.getName().equals("token")) {
                        cookie.setValue("");
                        cookie.setMaxAge(0);
                        cookie.setPath("/admin");
                        response.addCookie(cookie);
                    }
                }
            }
            redirectAttributes.addFlashAttribute("message", "Đăng xuất thành công");
        } catch (Exception e) {
            e.printStackTrace();
        }
        redirectAttributes.addFlashAttribute("message", "Đăng xuất không thành công");
        return "redirect:/admin/login";
    }
}
