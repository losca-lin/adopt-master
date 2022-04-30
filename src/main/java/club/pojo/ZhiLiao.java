package club.pojo;

import com.baomidou.mybatisplus.annotations.TableField;
import lombok.Data;

import java.time.LocalDate;

/**
 * @author Losca
 * @date 2022/4/19 15:54
 */
@Data
public class ZhiLiao {
    private Integer id;
    private Integer bingId;
    private String bingqingmiaoshu;
    private String time;
    private String alive;
    @TableField(exist = false)
    private Bing bing;
}
