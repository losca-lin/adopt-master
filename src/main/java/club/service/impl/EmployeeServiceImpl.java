package club.service.impl;

import club.dao.EmployeeMapper;
import club.pojo.Employee;
import club.service.EmployeeService;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * @author Losca
 * @date 2022/4/19 13:47
 */
@Service
public class EmployeeServiceImpl extends ServiceImpl<EmployeeMapper, Employee> implements EmployeeService {

    @Resource
    private EmployeeMapper employeeMapper;
    @Override
    public PageInfo<Employee> employeePage(String EmployeeName, Integer pageNum, Integer pageSize) {
        PageHelper.startPage(pageNum,pageSize);
        EntityWrapper wrapper = new EntityWrapper();
        if(EmployeeName != null && !"".equals(EmployeeName)){
            wrapper.like("EmployeeName",EmployeeName);
        }

        List list = employeeMapper.selectList(wrapper);
        PageInfo<Employee> pageInfo = new PageInfo<>(list);
        return pageInfo;
    }

    @Override
    public Employee login(String EmployeeName, String EmployeePwd) {
        Employee a = new Employee();
        a.setUsername(EmployeeName);
        Employee Employee = employeeMapper.selectOne(a);
        if (Employee != null && Employee.getPassword().equals(EmployeePwd)){
            return Employee;
        }
        return null;
    }

    @Override
    public PageInfo<Employee> allEmployee(String EmployeeName, int pageNum, int pageSize) {
        return null;
    }

    @Override
    public int add(Employee Employee) {
        return employeeMapper.insert(Employee);
    }

    @Override
    public int update(Employee Employee) {
        return employeeMapper.updateById(Employee);
    }

    @Override
    public Employee findById(Integer id) {
        return employeeMapper.selectById(id);
    }

    @Override
    public int del(Integer id) {
        return employeeMapper.deleteById(id);
    }
}
