package club.pojo;

import lombok.Data;

import java.time.LocalDate;

/**
 * @author Losca
 * @date 2022/4/19 15:54
 */
@Data
public class ZhiLiao {
    private Integer id;
    private Integer fenleiId;
    private Integer bingId;
    private String bingqingmiaoshu;
    private LocalDate time;
    private String alive;
}
