package club.aop;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.stereotype.Component;

/**
 * @author Losca
 * @date 2021/9/15 15:00
 */
@Component
@Aspect
public class AopConfig {

    /**
     * execution(*表示返回类型 后面为方法名 ..表示匹配所有参数)
     */
    @After(value = "execution(* club.controller.MailController.aaa(..))")
    public void before(JoinPoint point){
        System.out.println("通知了");
        System.out.println("====================================");
    }



}
