package club.service.impl;

import club.dao.BingMapper;
import club.dao.ZhiLiaoMapper;
import club.pojo.Bing;
import club.pojo.Visit;
import club.pojo.ZhiLiao;
import club.pojo.ZhiLiaoTable;
import club.service.ZhiLiaoService;
import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.text.NumberFormat;
import java.util.ArrayList;
import java.util.List;

/**
 * @author Losca
 * @date 2022/4/19 13:47
 */
@Service
public class ZhiLiaoServiceImpl extends ServiceImpl<ZhiLiaoMapper, ZhiLiao> implements ZhiLiaoService {
    @Autowired
    BingMapper bingMapper;
    @Override
    public PageInfo list(Integer pageNum, Integer pageSize, String value) {
        PageHelper.startPage(pageNum,pageSize);
        EntityWrapper<ZhiLiao> wrapper = new EntityWrapper<>();
        if(StrUtil.isNotBlank(value)){
            wrapper.like("time",value);
        }
        List<ZhiLiao> zhiLiaoList = this.selectList(wrapper);
        for (ZhiLiao zhiLiao : zhiLiaoList) {
            Bing bing = bingMapper.selectById(zhiLiao.getBingId());
            zhiLiao.setBing(bing);
        }
        PageInfo<ZhiLiao> pageInfo = new PageInfo<>(zhiLiaoList);
        return pageInfo;

    }

    @Override
    public List<ZhiLiaoTable> getTable() {
        List<ZhiLiaoTable> zhiLiaoTables = new ArrayList<>();
        EntityWrapper<ZhiLiao> wrapper = new EntityWrapper<>();
        wrapper.eq("alive","否").groupBy("bingid");
        List<ZhiLiao> zhiLiaoList = this.selectList(wrapper);
        for (ZhiLiao zhiLiao : zhiLiaoList) {
            ZhiLiaoTable zhiLiaoTable = new ZhiLiaoTable();
            EntityWrapper<ZhiLiao> zhiLiaoEntityWrapper = new EntityWrapper<>();
            zhiLiaoEntityWrapper.eq("bingid", zhiLiao.getBingId()).and()
                    .eq("alive","否");
            int deadCount = this.selectCount(zhiLiaoEntityWrapper);
            EntityWrapper<ZhiLiao> entityWrapper = new EntityWrapper<>();
            entityWrapper.eq("bingid", zhiLiao.getBingId());
            //总数
            double sum = this.selectCount(entityWrapper);
            Bing bing = bingMapper.selectById(zhiLiao.getBingId());
            zhiLiaoTable.setName(bing.getName());
            BigDecimal res = new BigDecimal(sum);
            BigDecimal divide = new BigDecimal(deadCount).divide(res, 2, RoundingMode.HALF_UP);

            zhiLiaoTable.setRate(divide);
            zhiLiaoTables.add(zhiLiaoTable);
        }
        return zhiLiaoTables;
    }
}
