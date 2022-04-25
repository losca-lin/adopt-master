package club.service.impl;

import club.dao.ADMapper;
import club.dao.ZhiLiaoMapper;
import club.pojo.AD;
import club.pojo.ZhiChu;
import club.pojo.ZhiLiao;
import club.service.ADService;
import club.service.ZhiLiaoService;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import java.util.List;

/**
 * @author Losca
 * @date 2022/4/19 13:47
 */
@Service
public class ADServiceImpl extends ServiceImpl<ADMapper, AD> implements ADService {
    @Autowired
    ADMapper adMapper;
    @Override
    public PageInfo list(Integer pageNum, Integer pageSize, String value) {
        PageHelper.startPage(pageNum, pageSize);
        EntityWrapper wrapper = new EntityWrapper();
        if (!StringUtils.isEmpty(value)){
            wrapper.like("type", value).or()
                    .like("brand", value);
        }
        List list = adMapper.selectList(wrapper);
        PageInfo<AD> pageInfo = new PageInfo<>(list);
        return pageInfo;
    }
}
