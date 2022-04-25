package club.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * ClassName: LayUiVO
 * date: 2021/5/26/026
 *
 * @author zlk
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class LayUiVO {
    private Integer code;
    private String msg;
    private long count;
    private Object data;
    public static LayUiVO success(long count,Object data){
        LayUiVO layuiVO = new LayUiVO();
        layuiVO.code = 0;
        layuiVO.msg = "成功";
        layuiVO.count = count;
        layuiVO.data = data;
        return layuiVO;
    }
}
