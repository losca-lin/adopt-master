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
@Constraint(validatedBy = Phone.PhoneCheck.class) //指定校验规则的类
public @interface Phone {

    String message() default "请输入正确的手机号码";

    Class<?>[] groups() default {};

    Class<? extends Payload>[] payload() default {};

    /**
     * 校验规则
     */
    @Component
    class PhoneCheck implements ConstraintValidator<Phone, String> {

        @Override
        public boolean isValid(String phone, ConstraintValidatorContext constraintValidatorContext) {
            if (PhoneUtil.isPhone(phone)) {
                return true;
            }

            String template = constraintValidatorContext.getDefaultConstraintMessageTemplate();
            System.out.println(template);
            return false;
        }
    }
}
