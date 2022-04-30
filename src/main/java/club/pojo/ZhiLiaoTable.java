package club.pojo;

import lombok.Data;

import java.math.BigDecimal;

/**
 * @author Losca
 * @date 2022/4/30 16:30
 */
@Data
public class ZhiLiaoTable {
    //病名
    private String name;
    //病死率
    private BigDecimal rate;
}
