package vnua.edu.controller.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller(value = "ErrorControllerOfWeb")
public class ErrorController {
    @GetMapping("/not-found")
    public String handleNotFound() {
        return "web/NotFound";
    }
}
