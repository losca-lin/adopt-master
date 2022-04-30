package club.controller;

import club.pojo.Visit;
import club.service.VisitService;
import club.vo.ResponseVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * @author Losca
 * @date 2022/4/30 13:07
 */
@Controller
@RequestMapping("/visit")
public class VisitController {
    @Autowired
    VisitService visitService;

    @RequestMapping(value = "/addVisit", method = RequestMethod.POST)
    public ResponseVO addVisit(Visit visit) {
        return ResponseVO.success(visitService.insert(visit));
    }

    @RequestMapping("/allVisit")
    @ResponseBody
    public ResponseVO allVisit(@RequestParam(defaultValue = "1") Integer pageNum
            , @RequestParam(defaultValue = "8") Integer pageSize
            , @RequestParam String value) {
        return ResponseVO.success(visitService.list(pageNum, pageSize, value));
    }
    @RequestMapping("/visitPage")
    public String visitPage(){
        return "admin/visit";
    }
}
