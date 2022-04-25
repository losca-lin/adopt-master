package club.controller;

import club.pojo.Publish;
import club.service.PublishService;
import club.vo.ResponseVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Calendar;
import java.util.Date;

/**
 * @author Losca
 * @date 2022/4/22 17:31
 */
@RequestMapping("/publish")
@Controller
public class PublishController {
    @Autowired
    private PublishService publishService;
    @RequestMapping(value = "/create",method = RequestMethod.POST)
    @ResponseBody
    public ResponseVO create(@RequestBody Publish publish){
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(publish.getTime());
        calendar.set(Calendar.DATE, calendar.get(Calendar.DATE) + 1);
        Date tomorrow = calendar.getTime();
        publish.setTime(tomorrow);
        return ResponseVO.success(publishService.insert(publish));
    }

    @RequestMapping("/myPublishPage")
    public String myPublishPage(){
        return "user/myPublish";
    }

    @RequestMapping("/myPublish")
    public ResponseVO myPublish(){
        return ResponseVO.success();
    }

    @RequestMapping("/getPublishData")
    @ResponseBody
    public ResponseVO getPublishData(Integer userId){
        return ResponseVO.success(publishService.getPublishData(userId));
    }
}
