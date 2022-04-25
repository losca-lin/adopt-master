package club.pojo;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

/**
 * @author Losca
 * @date 2022/4/22 17:28
 */
@Data
public class Publish {
    private Integer id;
    private Integer userid;
    private String username;
    private String title;
    private String content;
    private Integer status;
    @JsonFormat(pattern = "yyyy-MM-dd",timezone = "GMT+8")
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date time;
    private String addr;
}
