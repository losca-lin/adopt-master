package club.service.impl;

import club.dao.ZhiChuMapper;
import club.pojo.ZhiChu;
import club.service.ZhiChuService;
import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import java.util.ArrayList;
import java.util.List;

/**
 * @author Losca
 * @date 2022/4/19 13:47
 */
@Service
public class ZhiChuServiceImpl extends ServiceImpl<ZhiChuMapper, ZhiChu> implements ZhiChuService {
    @Autowired
    private ZhiChuMapper zhiChuMapper;



    @Override
    public PageInfo<ZhiChu> zhiChuPage(String adminName, Integer pageNum, Integer pageSize) {
        PageHelper.startPage(pageNum,pageSize);
        EntityWrapper wrapper = new EntityWrapper();
        List list = zhiChuMapper.selectList(wrapper);
        PageInfo<ZhiChu> pageInfo = new PageInfo<>(list);
        return pageInfo;
    }

    @Override
    public boolean saveBatch(ArrayList<ZhiChu> list) {
        return this.insertBatch(list);
    }

    @Override
    public int getProfit(String format) {
        EntityWrapper<ZhiChu> wrapper = new EntityWrapper<>();
        if(StrUtil.isNotBlank(format)){
            wrapper.like("time",format);
        }
        ZhiChu zhiChu = this.selectOne(wrapper);
        if(zhiChu == null){
            return 0;
        }
        return zhiChu.getShoujine() - zhiChu.getZhijine();

    }

    @Override
    public PageInfo<ZhiChu> list(Integer pageNum, Integer pageSize, String value) {
        PageHelper.startPage(pageNum, pageSize);
        EntityWrapper wrapper = new EntityWrapper();
        if (!StringUtils.isEmpty(value)){
            wrapper.like("zhichuleibie", value).or()
                    .like("miaoshu", value);
        }
        List list = zhiChuMapper.selectList(wrapper);
        PageInfo<ZhiChu> pageInfo = new PageInfo<>(list);
        return pageInfo;
    }

    @Override
    public ZhiChu findById(Integer id) {
        return this.selectById(id);
    }
}
