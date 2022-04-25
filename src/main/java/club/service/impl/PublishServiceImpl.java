package club.service.impl;

import club.dao.PublishMapper;
import club.pojo.Publish;
import club.service.PublishService;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author Losca
 * @date 2022/4/19 13:47
 */
@Service
public class PublishServiceImpl extends ServiceImpl<PublishMapper, Publish> implements PublishService {
    @Autowired
    private PublishMapper publishMapper;
    @Override
    public List<Publish> getPublishData(Integer userId) {
        EntityWrapper<Publish> wrapper = new EntityWrapper<>();
        if (userId != null){
            wrapper.eq("userid", userId);
        }
        return this.selectList(wrapper);
    }
}
