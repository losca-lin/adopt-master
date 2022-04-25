package club.service.impl;

import club.dao.BingMapper;
import club.dao.ZhiLiaoMapper;
import club.pojo.Bing;
import club.pojo.ZhiLiao;
import club.service.BingService;
import club.vo.EchartsVO;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author Losca
 * @date 2022/4/19 13:47
 */
@Service
public class BingServiceImpl extends ServiceImpl<BingMapper, Bing> implements BingService   {

    @Autowired
    private BingMapper bingMapper;
    @Autowired
    private ZhiLiaoMapper zhiLiaoMapper;

    @Override
    public EchartsVO getData() {
        List<ZhiLiao> zhiLiaos = zhiLiaoMapper.selectList(null);
        for (ZhiLiao zhiLiao : zhiLiaos) {

        }
        return null;
    }
}
