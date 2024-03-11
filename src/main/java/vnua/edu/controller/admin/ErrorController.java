package vnua.edu.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller(value = "ErrorControllerOfAdmin")
public class ErrorController {
    @GetMapping("/admin/not-found")
    public String handleNotFound() {
        return "admin/NotFound";
    }
}
