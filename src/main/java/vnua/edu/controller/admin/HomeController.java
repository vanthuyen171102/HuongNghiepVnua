package vnua.edu.controller.admin;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.servlet.ModelAndView;
import vnua.edu.model.Toast;

@Controller(value = "HomeControlerOfAdmin")
public class HomeController {
	@GetMapping(value = { "/admin", "/admin/trang-chu" })
	public ModelAndView homePage(@ModelAttribute("toast") Toast toast, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("admin/home");
		mav.addObject("toast", toast);

		return mav;
	}

}
