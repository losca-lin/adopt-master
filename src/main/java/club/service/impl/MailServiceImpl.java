package club.service.impl;

import club.service.MailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import javax.mail.internet.MimeMessage;

/**
 * @author Losca
 * @date 2022/4/26 21:31
 */
@Service
public class MailServiceImpl implements MailService {
    @Autowired(required = false)
    JavaMailSender mailSender;
    @Override
    public void send(String to, String content) throws Exception {
        MimeMessage mimeMessage = mailSender.createMimeMessage();
        MimeMessageHelper messageHelper = new MimeMessageHelper(mimeMessage, true, "utf-8");
        messageHelper.setFrom("783840358@qq.com");//发件人
        messageHelper.setTo(to);
        messageHelper.setSubject("测试");
        messageHelper.setText(content, true);//true代表支持html格式
        mailSender.send(mimeMessage);
    }
}
