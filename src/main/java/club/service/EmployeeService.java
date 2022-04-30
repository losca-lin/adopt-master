package club.service;

import club.pojo.Employee;
import club.pojo.Employee;
import club.pojo.ZhiLiao;
import club.pojo.ZhiLiaoTable;
import com.baomidou.mybatisplus.service.IService;
import com.github.pagehelper.PageInfo;

import java.util.List;

/**
 * @author Losca
 * @date 2022/4/19 13:46
 */
public interface EmployeeService extends IService<Employee> {

    PageInfo<Employee> employeePage(String employeeName,Integer pageNum,Integer pageSize);
    Employee findById(Integer id);
    Employee login(String employeeName, String employeePwd);
    PageInfo<Employee> allEmployee(String employeeName, int pageNum, int pageSize);
    int add(Employee Employee);
    int update(Employee Employee);
    int del(Integer id);
}
