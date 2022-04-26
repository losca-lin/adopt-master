package club.controller;

import club.pojo.Reply;
import club.service.MailService;
import club.service.ReplyService;
import club.vo.ResponseVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.mail.internet.MimeMessage;

/**
 * @author Losca
 * @date 2022/4/26 21:15
 */
@RequestMapping("/reply")
@Controller
public class ReplyController {
    @Autowired
    JavaMailSenderImpl mailSender;
    @Autowired
    ReplyService replyService;
    @RequestMapping(value = "/reply",method = RequestMethod.POST)
    @ResponseBody
    public ResponseVO reply(Reply reply) throws Exception {
        MimeMessage mimeMessage = mailSender.createMimeMessage();
        MimeMessageHelper messageHelper = new MimeMessageHelper(mimeMessage, true, "utf-8");
        messageHelper.setFrom("783840358@qq.com");//发件人
        messageHelper.setTo(reply.getEmail());
        messageHelper.setSubject("系统消息");
        messageHelper.setText(reply.getContent(), true);//true代表支持html格式
        mailSender.send(mimeMessage);
        return ResponseVO.success(replyService.insert(reply));
    }
}
