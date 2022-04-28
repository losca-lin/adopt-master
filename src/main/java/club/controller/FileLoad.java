package club.controller;

import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.util.ClassUtils;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.UUID;

/**
 * @author Mr Wu
 * @create: 2019-08-25 19:09
 */
@Controller
public class FileLoad {
    //获取项目目录
    public static String property = new File(ClassUtils.getDefaultClassLoader().getResource("").getPath()).getParentFile().getParentFile().getParentFile().getParent();

    public static String uploadAdminPic(MultipartFile file) {
        String picName = UUID.randomUUID().toString();
        //获取上传文件得元素得名称
        String fileName = file.getOriginalFilename();
        String substring = fileName.substring(fileName.lastIndexOf("."));
        //上传文件
        try {
            file.transferTo(new File(property + "/src/main/webapp/static/images/admin/" + picName + substring));
        } catch (IOException e) {
            e.printStackTrace();
        }
        String name = picName + substring;

        return name;
    }

    public static String uploadUserPic(MultipartFile file) {
        String picName = UUID.randomUUID().toString();
        //获取上传文件得元素得名称
        String fileName = file.getOriginalFilename();
        String substring = fileName.substring(fileName.lastIndexOf("."));
        //上传文件
        try {
            file.transferTo(new File(property+"/src/main/webapp/static/images/user/" + picName + substring));
        } catch (IOException e) {
            e.printStackTrace();
        }
        String name = picName + substring;

        return name;
    }

    public static String uploadPetPic(MultipartFile file) {
        System.out.println(property);
        String picName = UUID.randomUUID().toString();
        //获取上传文件得元素得名称
        String fileName = file.getOriginalFilename();
        String substring = fileName.substring(fileName.lastIndexOf("."));
        //上传文件
        try {
            file.transferTo(new File(property+"/src/main/webapp/static/images/animal/" + picName + substring));
        } catch (IOException e) {
            e.printStackTrace();
        }
        String name = picName + substring;

        return name;
    }

    public static String uploadAdPic(MultipartFile file) {
        String picName = UUID.randomUUID().toString();
        //获取上传文件得元素得名称
        String fileName = file.getOriginalFilename();
        String substring = fileName.substring(fileName.lastIndexOf("."));
        //上传文件
        try {
            file.transferTo(new File(property+"/src/main/webapp/static/images/ad/" + picName + substring));
        } catch (IOException e) {
            e.printStackTrace();
        }
        String name = picName + substring;
        return name;
    }


}
