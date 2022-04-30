package club.controller;

import club.pojo.Employee;
import club.service.EmployeeService;
import club.service.PetService;
import club.service.UserService;
import club.service.ZhiChuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;

/**
 * @author Losca
 * @date 2022/4/30 23:32
 */
@RequestMapping("/employee")
@Controller
public class EmployeeController {
    @Autowired
    UserService userService;
    @Autowired
    PetService petService;
    @Autowired
    ZhiChuService zhiChuService;
    @Autowired
    EmployeeService employeeService;
    @RequestMapping("/zhiliaoPage")
    public String healPage(){
        return "employee/zhiliao";
    }

    @RequestMapping("/moneyPage")
    public String moneyPage(){
        return "employee/money";
    }

    @RequestMapping("/addMoneyPage")
    public String addMoneyPage(){
        return "employee/add";
    }

    @RequestMapping("/showPage")
    public String showPage(ModelMap map){
        HashMap<String, Integer> hashMap = new HashMap<>();
        int userCount = userService.selectCount(null);
        int petCount = petService.selectCount(null);
        String format = LocalDate.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd"));
        int profit = zhiChuService.getProfit(format);
        hashMap.put("userCount",userCount);
        hashMap.put("petCount",petCount);
        hashMap.put("profit",profit);
        map.addAttribute("dataList",hashMap);
        return "employee/show";
    }
    @RequestMapping("/nav")
    public String nav(){
        return "employee/common/nav";
    }

    @RequestMapping("/employee")
    public String employee(){
        return "employee/employee";
    }

    @RequestMapping("/adopt")
    public String adopt(){
        return "employee/adopt";
    }

    @RequestMapping("/agree")
    public String agree(){
        return "employee/agree";
    }

    @RequestMapping("/apply")
    public String apply(){
        return "employee/apply";
    }

    @RequestMapping("/blog")
    public String blog(){
        return "employee/blog";
    }

    @RequestMapping("/comment")
    public String comment(){
        return "employee/comment";
    }

    @RequestMapping("/disAgree")
    public String disAgree(){
        return "employee/disAgree";
    }

    @RequestMapping("/pet")
    public String pet(){
        return "employee/pet";
    }
    @RequestMapping("/publishPage")
    public String publishPage(){
        return "employee/publish";
    }

    @RequestMapping("/user")
    public String user(){
        return "employee/user";
    }

    @RequestMapping("/login")
    public String login(){
        return "employee/login";
    }

    @RequestMapping("/dologin")
    public String doLogin(HttpSession session, String employeeName, String employeePwd){
        Employee login = employeeService.login(employeeName, employeePwd);
        if (login == null){
            session.setAttribute("msg","用户名或密码错误！");
            return "redirect:/employee/login";
        }
        session.setAttribute("employee",login);
        return "redirect:/employee/employee";
    }

    @RequestMapping("/logout")
    public String logout(HttpSession session){
        session.invalidate();
        return "redirect:/employee/login";
    }

    @RequestMapping("/developing")
    public String developing(){
        return "employee/developing";
    }
    @RequestMapping("/applyShow")
    public String applyShow(){
        return "employee/applyShow";
    }
}
