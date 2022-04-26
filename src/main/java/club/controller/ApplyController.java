package club.controller;

import club.pojo.Apply;
import club.service.ApplyService;
import club.util.Message;
import club.vo.ResponseVO;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.Date;

@Controller
@RequestMapping("/apply")
public class ApplyController {
    @Resource
    private ApplyService applyService;


    @RequestMapping("/allApply")
    @ResponseBody
    public ResponseVO allMoney(@RequestParam(defaultValue = "1") Integer pageNum
            , @RequestParam(defaultValue = "8") Integer pageSize
            , @RequestParam String value){
        return ResponseVO.success(applyService.list(pageNum,pageSize,value));
    }

    @RequestMapping("/findById")
    @ResponseBody
    public Message findByid(Integer id){
        Apply byid = applyService.findByid(id);
        return Message.success().add("apply",byid);
    }
    @RequestMapping(value = "/update",method = RequestMethod.POST)
    @ResponseBody
    public ResponseVO update(@RequestBody Apply apply){
        return ResponseVO.success(applyService.updateApply(apply));
    }
    @RequestMapping("/delete")
    @ResponseBody
    public Message delete(Integer id){
        int i = applyService.del(id);
        if(i > 0){
            return Message.success();
        }else {
            return Message.fail();
        }
    }
    @RequestMapping("/create")
    @ResponseBody
    public Message create(Apply apply){
        apply.setApplyTime(new Date());
        apply.setState(2);
        Integer integer = applyService.create(apply);
        if(integer > 0){
            return Message.success();
        }else {
            return Message.fail();
        }
    }
}
