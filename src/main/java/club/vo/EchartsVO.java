package club.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * ClassName: EchartsVO
 * date: 2021/6/18/018
 *
 * @author zlk
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class EchartsVO {
    private Integer code;
    private Object data;

    public static EchartsVO success(Object data) {
        EchartsVO echartsVO = new EchartsVO();
        echartsVO.code = 200;
        echartsVO.data = data;
        return echartsVO;
    }


    public static EchartsVO error(Integer code) {
        EchartsVO echartsVO = new EchartsVO();
        echartsVO.code = code;
        return echartsVO;
    }
}
