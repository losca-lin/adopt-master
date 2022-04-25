package club.controller;

import club.vo.EchartsVO;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * @author Losca
 * @date 2022/4/19 13:12
 */
@RequestMapping("/table")
@Controller
public class ShowController {
    @RequestMapping("/showPage")
    public String showPage(){
        return "admin/show";
    }

    @RequestMapping("/getData")
    @ResponseBody
    public EchartsVO getData(){
        return EchartsVO.error(200);
    }
}
