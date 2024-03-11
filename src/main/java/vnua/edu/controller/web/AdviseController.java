package vnua.edu.controller.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;
import vnua.edu.model.Advise;
import vnua.edu.service.AdviseService;

import javax.servlet.http.HttpServletRequest;
import java.time.LocalDateTime;

@Controller(value = "AdviseControllerOfWeb")

public class AdviseController {

    @Autowired
    private AdviseService adviseService;


    @GetMapping("/tu-van")
    public ModelAndView Index() {
        ModelAndView mav = new ModelAndView("/web/advise/index");
        return mav;
    }

    @PostMapping("/send-advise-form")
    public ResponseEntity<Object> processAdviseForm(HttpServletRequest request) {
        try {
            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String phone = request.getParameter("phone");
            String content = request.getParameter("content");
            boolean result = adviseService.createAdvise(new Advise(name, email, phone, content));
            if(result)
                return ResponseEntity.status(HttpStatus.OK).body("Yêu cầu tư vấn đã được tiếp nhận");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("Yêu cầu tư vấn không thành công");
    }
}
