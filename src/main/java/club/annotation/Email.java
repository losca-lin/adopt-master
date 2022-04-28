package club.annotation;

import cn.hutool.core.util.PhoneUtil;
import org.springframework.stereotype.Component;

import javax.validation.Constraint;
import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;
import javax.validation.Payload;
import java.lang.annotation.*;
import java.util.regex.Pattern;

/**
 * @author Losca
 * @date 2022/4/28 11:31
 */
@Documented
@Target({ElementType.FIELD, ElementType.PARAMETER}) //定义可以在字段上使用
@Retention(RetentionPolicy.RUNTIME)
@Constraint(validatedBy = Email.EmailCheck.class) //指定校验规则的类
public @interface Email {

    String message() default "请输入正确的邮箱";

    Class<?>[] groups() default {};

    Class<? extends Payload>[] payload() default {};

    /**
     * 校验规则
     */
    @Component
    class EmailCheck implements ConstraintValidator<Email, String> {

        @Override
        public boolean isValid(String email, ConstraintValidatorContext constraintValidatorContext) {
            String emailMatcher="[a-zA-Z0-9]+@[a-zA-Z0-9]+\\.[a-zA-Z0-9]+";

            //write your code here......
           if(Pattern.matches(emailMatcher,email)){
               return true;
           }
            String template = constraintValidatorContext.getDefaultConstraintMessageTemplate();
            System.out.println(template);
            return false;
        }
    }
}
