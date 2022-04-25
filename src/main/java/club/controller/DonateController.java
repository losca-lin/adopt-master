package club.controller;

import club.pojo.Donate;
import club.service.DonateService;
import club.vo.ResponseVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

/**
 * @author Losca
 * @date 2022/4/23 16:00
 */
@Controller
@RequestMapping("/donate")
public class DonateController {
    @Autowired
    JavaMailSenderImpl mailSender;
    @Autowired
    DonateService donateService;
    @RequestMapping("/donatePage")
    public String donatePage(String name, HttpSession session) {
        session.setAttribute("title", name);
        return "user/donate";
    }

    @RequestMapping(value = "/create",method = RequestMethod.POST)
    @ResponseBody
    public ResponseVO create(@RequestBody Donate donate) throws MessagingException {
        boolean insert = donateService.insert(donate);
        MimeMessage mimeMessage = mailSender.createMimeMessage();
        MimeMessageHelper messageHelper = new MimeMessageHelper(mimeMessage, true, "utf-8");
        messageHelper.setFrom("783840358@qq.com");//发件人
        messageHelper.setTo(donate.getEmail());
        messageHelper.setSubject("系统消息");
        messageHelper.setText("感谢您的捐赠", true);//true代表支持html格式
        mailSender.send(mimeMessage);
        return ResponseVO.success(insert);
    }

    @RequestMapping("/adminDonatePage")
    public String adminDonatePage(){
        return "admin/donate";
    }
    @RequestMapping("/getAll")
    @ResponseBody
    public ResponseVO getAll(@RequestParam(defaultValue = "1") Integer pageNum
            , @RequestParam(defaultValue = "8") Integer pageSize
            , @RequestParam String value){
        return ResponseVO.success(donateService.list(pageNum,pageSize,value));
    }
}
