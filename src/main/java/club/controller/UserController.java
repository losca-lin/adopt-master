package club.controller;

import club.pojo.User;
import club.service.UserService;
import club.util.Message;
import club.vo.ResponseVO;
import cn.hutool.captcha.CaptchaUtil;
import cn.hutool.captcha.LineCaptcha;
import cn.hutool.core.lang.Console;
import cn.hutool.core.util.StrUtil;
import com.github.pagehelper.PageInfo;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.io.IOException;

@Controller
@RequestMapping("/user")
public class UserController {
    @Resource
    private UserService userService;

    @RequestMapping("/create")
    @ResponseBody
    public Message add(@Valid User user, BindingResult result){
        if (result.getErrorCount() > 0) {
            return Message.fail(result.getAllErrors().get(0).getDefaultMessage());
        }
        String userName = user.getUserName();
        if(userService.findByUsername(userName) != null){
            return Message.fail("用户已经被注册了");
        }
        int add = userService.add(user);
        if(add>0){
            return Message.success();
        }else{
            return Message.fail("注册失败");
        }
    }

    @RequestMapping("/getCode")
    public void getCode(HttpServletRequest request, HttpServletResponse response) throws IOException {
        //定义图形验证码的长和宽
        LineCaptcha lineCaptcha = CaptchaUtil.createLineCaptcha(116, 36,4,20);
        //把验证码信息存到sesion
        request.getSession().setAttribute("code",lineCaptcha.getCode());
        //输出code
        Console.log(lineCaptcha.getCode());
        //图形验证码写出，可以写出到文件，也可以写出到流
        lineCaptcha.write(response.getOutputStream());
    }

    @RequestMapping("/login")
    @ResponseBody
    public Message loginuser(HttpSession session, String userName, String password,String code){
        String codeData = (String) session.getAttribute("code");
        if(StrUtil.isNotBlank(code) && codeData.equals(code)){
            User user = userService.loginuser(userName, password);
            if (user != null){
                session.setAttribute("user",user);
                return Message.success().add("user",user);
            }else{
                return Message.fail();
            }
        }
        return Message.fail("请输入验证码！");

    }
    @RequestMapping("/logout")
    @ResponseBody
    public Message logout(HttpSession session){
        session.invalidate();
        return Message.success();
    }

    @RequestMapping("/users")
    @ResponseBody
    public Message users(@RequestParam(required = false) String userName, @RequestParam("pn")Integer pageNum){
        Integer pageSize = 4;
        PageInfo<User> users = userService.allUser(userName,pageNum,pageSize);
        return Message.success().add("pageInfo",users);
    }

    @RequestMapping("findById")
    @ResponseBody
    public Message findById(Integer id){
        User byId = userService.findById(id);
        return Message.success().add("user",byId);
    }

    @RequestMapping("/delete")
    @ResponseBody
    public Message del(Integer id){
        int del = userService.del(id);
        if(del>0){
            return Message.success();
        }else {
            return Message.fail();
        }
    }

    @RequestMapping("/about")
    public String about(){
        return "user/about";
    }
    @RequestMapping("/cat")
    public String cat(){
        return "user/cat";
    }
    @RequestMapping("/dog")
    public String dog(){
        return "user/dog";
    }

    @RequestMapping("/error")
    public String error(){
        return "user/error";
    }

    @RequestMapping("/index")
    public String index(){
        return "user/index";
    }

    @RequestMapping("/personal-info")
    public String personalInfo(){
        return "user/personal-info";
    }

    @RequestMapping("/service")
    public String service(){
        return "user/service";
    }

    @RequestMapping("/show")
    public String show(){
        return "user/show";
    }

    @RequestMapping("/team")
    public String team(){
        return "user/team";
    }

    @RequestMapping("/teamBlog")
    public String teamBlog(){
        return "user/teamBlog";
    }

    @RequestMapping("/update")
    @ResponseBody
    public Message update(User user){
        Integer update = userService.update(user);
        if(update > 0){
            return Message.success();
        }else {
            return Message.fail();
        }
    }

    @RequestMapping("/updatePic")
    @ResponseBody
    public Message updatePic(HttpSession session, MultipartFile file){
        String fileName = FileLoad.uploadUserPic(file);
        User user = (User) session.getAttribute("user");
        user.setPic(fileName);
        Integer update = userService.update(user);
        if (update > 0){
            return Message.success();
        }else {
            return Message.fail();
        }
    }
    @RequestMapping("/publishPage")
    public String publishPage(){
        return "user/publish";
    }
}
