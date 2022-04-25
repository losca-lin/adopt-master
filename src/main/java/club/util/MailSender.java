package club.util;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Component;

import javax.mail.*;
import javax.mail.internet.MimeMessage;

/**
 * @author Losca
 * @date 2022/4/24 16:04
 */
public class MailSender {

    @Autowired
    JavaMailSenderImpl mailSender;

    public void send() throws Exception {
        MimeMessage mimeMessage = mailSender.createMimeMessage();
        MimeMessageHelper messageHelper = new MimeMessageHelper(mimeMessage, true, "utf-8");
        messageHelper.setFrom("783840358@qq.com");//发件人
        messageHelper.setTo("783840358@qq.com");
        messageHelper.setSubject("测试");
        messageHelper.setText("请尽快填写验证码", true);//true代表支持html格式
        mailSender.send(mimeMessage);
    }


}
