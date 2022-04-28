package club.pojo;

import club.annotation.Email;
import club.annotation.Phone;
import com.baomidou.mybatisplus.annotations.TableField;
import lombok.Data;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import java.util.List;

/**
 * @author Mr Wu
 * @create: 2019-08-20 14:18
 */
@Data
public class User {
    private Integer id;
    @NotBlank(message = "用户名不能为空")
    private String userName;
    @NotBlank(message = "密码不能为空")
    private String password;
    @NotBlank(message = "性别不能为空")
    private String sex;
    @NotNull(message = "年龄不能为空")
    private Integer age;
    @Phone(message = "请输入正确的手机号")
    private String telephone;
    @Email(message = "请输入正确的邮箱")
    private String Email;
    @NotBlank(message = "地址不能为空")
    private String address;
    private String pic;
    private Integer state;
    @TableField(exist = false)
    List<Comment> commentList;
    @TableField(exist = false)
    List<AdoptAnimal> animalList;

}
