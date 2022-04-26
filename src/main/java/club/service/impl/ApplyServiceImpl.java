package club.service.impl;

import club.dao.ApplyMapper;
import club.pojo.Apply;
import club.service.ApplyService;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;

import javax.annotation.Resource;
import java.util.List;

@Service
@Transactional
public class ApplyServiceImpl implements ApplyService {
    @Resource
    private ApplyMapper applyMapper;
    @Override
    public PageInfo<Apply> allApply(Integer state, Integer pageNum, Integer pageSize) {
        PageHelper.startPage(pageNum,pageSize);
        EntityWrapper wrapper = new EntityWrapper();
        if(state != null && state != 0){
            wrapper.eq("state",state);
        }
        List list = applyMapper.selectList(wrapper);
        PageInfo<Apply> pageInfo = new PageInfo<>(list);
        return pageInfo;
    }

    @Override
    public Apply findByid(Integer id) {
        return applyMapper.selectById(id);
    }

    @Override
    public int updateApply(Apply apply) {
        return applyMapper.updateById(apply);
    }

    @Override
    public int del(Integer id) {
        return applyMapper.deleteById(id);
    }

    @Override
    public Integer create(Apply apply) {
        return applyMapper.insert(apply);
    }

    @Override
    public PageInfo list(Integer pageNum, Integer pageSize, String value) {
        PageHelper.startPage(pageNum,pageSize);
        EntityWrapper wrapper = new EntityWrapper();
        if (!StringUtils.isEmpty(value) && !("2".equals(value))){
            wrapper.like("state",value);
        }
        List list = applyMapper.selectList(wrapper);
        PageInfo<Apply> pageInfo = new PageInfo<>(list);
        return pageInfo;
    }
}
