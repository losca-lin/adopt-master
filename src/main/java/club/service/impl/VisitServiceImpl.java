package club.service.impl;

import club.dao.VisitMapper;
import club.dao.ZhiLiaoMapper;
import club.pojo.AdoptAnimal;
import club.pojo.Visit;
import club.pojo.ZhiLiao;
import club.service.VisitService;
import club.service.ZhiLiaoService;
import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author Losca
 * @date 2022/4/19 13:47
 */
@Service
public class VisitServiceImpl extends ServiceImpl<VisitMapper, Visit> implements VisitService {
    @Override
    public PageInfo list(Integer pageNum, Integer pageSize, String value) {
        PageHelper.startPage(pageNum,pageSize);
        EntityWrapper<Visit> wrapper = new EntityWrapper<>();
        if(StrUtil.isNotBlank(value)){
            wrapper.like("username",value);
        }
        List<Visit> visits = this.selectList(wrapper);
        PageInfo<Visit> pageInfo = new PageInfo<>(visits);
        return pageInfo;
    }
}
