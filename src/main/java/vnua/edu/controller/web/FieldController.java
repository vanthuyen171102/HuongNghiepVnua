package vnua.edu.controller.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.servlet.ModelAndView;
import vnua.edu.model.Field;
import vnua.edu.model.Specialized;
import vnua.edu.model.Toast;
import vnua.edu.service.FieldService;
import vnua.edu.service.SpecializedService;

import java.util.List;
import java.util.stream.Collectors;

@Controller(value = "FieldControllerOfWeb")

public class FieldController {

    @Autowired
    private FieldService fieldService;
    @Autowired
    private SpecializedService specializedService;

    @GetMapping("/nghanh-hoc")
    public ModelAndView Index() {
        ModelAndView mav = new ModelAndView("/web/field/index");
        mav.addObject("fieldList", fieldService.getFieldList());
        return mav;
    }

    @GetMapping("/nghanh-hoc/{id}")
    public ModelAndView Details(@PathVariable String id) {
        ModelAndView mav = new ModelAndView("/web/field/details");
        Field field = fieldService.getFieldById(id);
        if(field == null) {
            mav.setViewName("NotFound");
        }
        else {
            mav.addObject("field", field);
            List<Specialized> specializedList = specializedService.getSpecializedList()
                    .stream()
                    .filter(specialized -> specialized.getField_id().equals(id))
                    .collect(Collectors.toList());
            mav.addObject("specializedList", specializedList);

        }
        return mav;
    }
}
