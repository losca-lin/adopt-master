package club.service.impl;

import club.dao.PetMapper;
import club.dao.ZhiLiaoMapper;
import club.pojo.Form;
import club.pojo.Pet;
import club.pojo.ZhiLiao;
import club.service.PetService;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.math.BigDecimal;
import java.math.RoundingMode;
import java.text.NumberFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
@Transactional
public class PetServiceImpl extends ServiceImpl<PetMapper, Pet> implements PetService {

    @Resource
    private PetMapper petMapper;

    @Override
    public PageInfo<Pet> pets(Integer pageNum, Integer pagesize) {
        PageHelper.startPage(pageNum, pagesize);
        List<Pet> pets = petMapper.selectList(null);
        PageInfo<Pet> pageInfo = new PageInfo<Pet>(pets, 3);
        return pageInfo;
    }

    @Override
    public Pet findById(Integer id) {
        return petMapper.selectById(id);
    }

    @Override
    public Integer create(Pet pet) {
        return petMapper.insert(pet);
    }

    @Override
    public PageInfo<Pet> allPet(String petType, Integer pageNum, Integer pageSize) {
        PageHelper.startPage(pageNum, pageSize);
        EntityWrapper<Pet> wrapper = new EntityWrapper<>();
        if (petType != null && !"".equals(petType)) {
            wrapper.like("petType", petType);
        }
        List<Pet> pets = petMapper.selectList(wrapper);
        PageInfo<Pet> pageInfo = new PageInfo<>(pets, 3);
        return pageInfo;
    }

    @Override
    public int add(Pet pet) {
        return petMapper.insert(pet);
    }

    @Override
    public int update(Pet pet) {
        return petMapper.updateById(pet);
    }

    @Override
    public int del(Integer id) {
        return petMapper.deleteById(id);
    }

    @Override
    public List<Form> getTable() {
        List<Form> forms = new ArrayList<>();
        EntityWrapper<Pet> wrapper = new EntityWrapper<>();
        //获取总数
        BigDecimal sum = new BigDecimal( petMapper.selectList(null).size());
        wrapper.groupBy("petType");
        List<Pet> pets = petMapper.selectList(wrapper);
        for (Pet pet : pets) {
            EntityWrapper<Pet> petEntityWrapper = new EntityWrapper<>();
            petEntityWrapper.eq("petType", pet.getPetType());
            Integer count = petMapper.selectCount(petEntityWrapper);
            BigDecimal divide = new BigDecimal(count).divide(sum, 2, RoundingMode.HALF_UP);
            //转百分比
            NumberFormat percent = NumberFormat.getPercentInstance();
            percent.setMaximumFractionDigits(2);
            String format = percent.format(divide.doubleValue());
            Form form = new Form();
            form.setValue(count);
            form.setName(pet.getPetType()+format);
            forms.add(form);
        }

        return forms;
    }
}
