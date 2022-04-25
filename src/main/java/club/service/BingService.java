package club.service;

import club.pojo.Bing;
import club.vo.EchartsVO;
import com.baomidou.mybatisplus.service.IService;

/**
 * @author Losca
 * @date 2022/4/19 13:46
 */
public interface BingService extends IService<Bing> {
    EchartsVO getData();
}
