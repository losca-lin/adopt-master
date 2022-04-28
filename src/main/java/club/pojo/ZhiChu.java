package club.pojo;


import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

/**
 * @author Losca
 * @date 2022/4/19 16:37
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class ZhiChu {
    private Integer id;
    @JsonFormat(pattern="yyyy-MM-dd",timezone="GMT+8")
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date time;
    private String zhichuleibie;
    private Integer zhijine;
    private String shouruleibie;
    private Integer shoujine;
    private String miaoshu;
}
