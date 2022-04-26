package club.service;

import org.springframework.stereotype.Service;

/**
 * @author Losca
 * @date 2022/4/26 21:30
 */
public interface MailService {
    void send(String to,String content) throws Exception;
}
