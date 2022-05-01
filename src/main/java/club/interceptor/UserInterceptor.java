package club.interceptor;

import club.pojo.Admins;
import club.pojo.Employee;
import club.pojo.User;
import club.vo.ResponseVO;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.PrintWriter;
import java.lang.reflect.Method;

/**
 * @author Losca
 * @date 2022/5/1 11:47
 */
public class UserInterceptor implements HandlerInterceptor {
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        HttpSession session = request.getSession();
        Admins admin = (Admins) session.getAttribute("admin");
        Employee employee = (Employee) session.getAttribute("employee");
        /*没有登录跳转回登录页*/
        if (admin == null){
            /*获取调用的方法注解*/
            HandlerMethod handlerMethod = (HandlerMethod) handler;
            Method method = handlerMethod.getMethod();
            ResponseBody responseBody = method.getDeclaredAnnotation(ResponseBody.class);
            if (responseBody != null){
                /*设置响应头为json格式*/
                response.setContentType("application/json;charset=utf-8");
                /*拦截ajax返回vo*/
                ResponseVO responseVO = ResponseVO.failed(403,"请先登录再操作");
                /*将vo转换为json格式*/
                ObjectMapper objectMapper = new ObjectMapper();
                String s = objectMapper.writeValueAsString(responseVO);
                PrintWriter writer = response.getWriter();
                writer.print(s);
                writer.close();

            }else {
                /*拦截页面跳转回登录页*/
                response.sendRedirect(request.getServletContext().getContextPath()+"/admin/login");
            }
            return false;
        }
        if (admin != null){return true;}
        if (employee == null){
            /*获取调用的方法注解*/
            HandlerMethod handlerMethod = (HandlerMethod) handler;
            Method method = handlerMethod.getMethod();
            ResponseBody responseBody = method.getDeclaredAnnotation(ResponseBody.class);
            if (responseBody != null){
                /*设置响应头为json格式*/
                response.setContentType("application/json;charset=utf-8");
                /*拦截ajax返回vo*/
                ResponseVO responseVO = ResponseVO.failed(403,"请先登录再操作");
                /*将vo转换为json格式*/
                ObjectMapper objectMapper = new ObjectMapper();
                String s = objectMapper.writeValueAsString(responseVO);
                PrintWriter writer = response.getWriter();
                writer.print(s);
                writer.close();

            }else {
                /*拦截页面跳转回登录页*/
                response.sendRedirect(request.getServletContext().getContextPath()+"/employee/login");
            }
            return false;
        }
        if(employee != null){
            return true;
        }
        return true;
    }

    @Override
    public void postHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, ModelAndView modelAndView) throws Exception {

    }

    @Override
    public void afterCompletion(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, Exception e) throws Exception {

    }
}
