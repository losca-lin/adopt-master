package club.service.impl;

import club.dao.UserMapper;
import club.dao.ZhiChuMapper;
import club.pojo.User;
import club.pojo.ZhiChu;
import club.service.UserService;
import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.service.IService;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

@Service
@Transactional
public class UserServiceImpl extends ServiceImpl<UserMapper, User> implements UserService {
    @Resource
    private UserMapper userMapper;
    @Override
    public User findById(Integer id) {
        return userMapper.selectById(id);
    }

    @Override
    public List<User> findByName(String userName, Integer state) {
        EntityWrapper<User> wrapper = new EntityWrapper<>();
        if (userName != null && !userName.equals("")){
            wrapper.like("userName", userName);
        }
        if (state != null){
            wrapper.eq("state", state);
        }
        return userMapper.selectList(wrapper);
    }

    @Override
    public List<User> showName(String userName) {
        EntityWrapper wrapper = new EntityWrapper();
        if(userName != null && !userName.equals("")){
            wrapper.like("userName",userName);
        }
        return userMapper.selectList(wrapper);
    }

    @Override
    public User loginuser(String userName, String password) {
        User user = new User();
        user.setUserName(userName);
        User user1 = userMapper.selectOne(user);
        if (user1 != null && user1.getPassword().equals(password)) {
            return user1;
        }
        return null;
    }

    @Override
    public Integer update(User user) {
        return userMapper.updateById(user);
    }

    @Override
    public PageInfo<User> allUser(String userName ,Integer pageNum, Integer pageSize) {
        PageHelper.startPage(pageNum, pageSize);
        EntityWrapper<User> wrapper = new EntityWrapper<>();
        if(userName != null && !"".equals(userName)){
            wrapper.like("userName",userName);
        }

        List<User> list = userMapper.selectList(wrapper);
        PageInfo<User> pageInfo = new PageInfo<>(list);
        return pageInfo;
    }

    @Override
    public int add(User user) {
        return userMapper.insert(user);
    }

    @Override
    public int del(Integer id) {
        return userMapper.deleteById(id);
    }

    @Override
    public User findByUsername(String username) {
        EntityWrapper<User> wrapper = new EntityWrapper<>();
        if(StrUtil.isNotBlank(username)){
            wrapper.eq("userName", username);
        }
       return this.selectOne(wrapper);
    }
}
