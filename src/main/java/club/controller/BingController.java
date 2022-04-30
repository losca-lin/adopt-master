package club.controller;

import club.service.BingService;
import club.vo.ResponseVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * @author Losca
 * @date 2022/4/30 15:23
 */
@RequestMapping("/bing")
@Controller
public class BingController {
    @Autowired
    BingService bingService;
    @RequestMapping("/getAll")
    @ResponseBody
    public ResponseVO getAll(){
        return ResponseVO.success(bingService.selectList(null));
    }
}
