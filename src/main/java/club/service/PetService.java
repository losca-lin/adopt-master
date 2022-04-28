package club.service;

import club.pojo.Form;
import club.pojo.Pet;
import club.pojo.ZhiLiao;
import com.baomidou.mybatisplus.service.IService;
import com.github.pagehelper.PageInfo;

import java.math.BigDecimal;
import java.util.List;
import java.util.Map;

public interface PetService extends IService<Pet> {
    PageInfo<Pet> pets(Integer pageNum, Integer pagesize);
    Pet findById(Integer id);
    Integer create(Pet pet);
    PageInfo<Pet> allPet(String petType, Integer pageNum, Integer pageSize);
    int add(Pet pet);
    int update(Pet pet);
    int del(Integer id);

    List<Form> getTable();
}
