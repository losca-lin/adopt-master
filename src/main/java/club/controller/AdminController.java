package club.controller;

import club.pojo.Admins;
import club.pojo.Bing;
import club.pojo.Publish;
import club.pojo.ZhiChu;
import club.service.*;
import club.util.Message;
import club.vo.EchartsVO;
import club.vo.ResponseVO;
import com.github.pagehelper.PageInfo;
import org.apache.commons.io.FilenameUtils;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.*;

@Controller
@RequestMapping("/admin")
public class AdminController {
    @Resource
    private AdminService adminService;
    @Autowired
    private BingService bingService;
    @Autowired
    private ZhiChuService zhiChuService;
    @Autowired
    private UserService userService;
    @Autowired
    private PetService petService;
    @Autowired
    private PublishService publishService;

    //execl文件处理
    @RequestMapping(value = "/upload",method = RequestMethod.POST)
    @ResponseBody
    public ResponseVO upload(MultipartFile file) throws IOException, ParseException {
        Workbook workbook = null;
        String suffix = FilenameUtils.getExtension(file.getOriginalFilename());
        if ("xlsx".equalsIgnoreCase(suffix)){
            workbook = new XSSFWorkbook(file.getInputStream());
        }else {
            workbook = new HSSFWorkbook(file.getInputStream());
        }
        Sheet sheetAt = workbook.getSheetAt(0);
        //获取最后一行行数
        int lastRowNum = sheetAt.getLastRowNum();
        ArrayList<ZhiChu> list = new ArrayList<>();
        for (int i = 1; i <= lastRowNum; i++) {
            Row row = sheetAt.getRow(i);
            ZhiChu xml = new ZhiChu();
            //把数据存在列表里面
            String trim1 = row.getCell(0).getStringCellValue().trim();
            SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy/MM/dd");
            Date parse = simpleDateFormat.parse(trim1);
            xml.setTime(parse);
            xml.setZhichuleibie(row.getCell(1).getStringCellValue().trim());
            String trim = row.getCell(2).getStringCellValue().trim();
            Integer money = Integer.parseInt(trim);
            xml.setZhijine(money);
            xml.setMiaoshu(row.getCell(3).getStringCellValue().trim());
            list.add(xml);
        }
        //把学生插入数据库
        zhiChuService.saveBatch(list);
        return ResponseVO.success("导入成功");
    }
    @RequestMapping("/moneyPage")
    public String moneyPage(){
        return "admin/money";
    }

    @RequestMapping("/allMoney")
    @ResponseBody
    public ResponseVO allMoney(@RequestParam(defaultValue = "1") Integer pageNum
    , @RequestParam(defaultValue = "8") Integer pageSize
    , @RequestParam String value){
        return ResponseVO.success(zhiChuService.list(pageNum,pageSize,value));
    }

    @RequestMapping("/addMoneyPage")
    public String addMoneyPage(){
        return "admin/add";
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
        return "admin/show";
    }

    @RequestMapping("/getData")
    @ResponseBody
    public EchartsVO getData(){
        List<Bing> bings = bingService.selectList(null);
        return EchartsVO.success(bings);
    }

    @RequestMapping("/nav")
    public String nav(){
        return "admin/common/nav";
    }
    @RequestMapping("/create")
    @ResponseBody
    public Message add(Admins admins, MultipartFile file){
        String pic = FileLoad.uploadAdminPic(file);
        admins.setPic(pic);
        int add = adminService.add(admins);
        if(add>0){
            return Message.success();
        }else{
            return Message.fail();
        }
    }

    @RequestMapping("findById")
    @ResponseBody
    public Message findById(Integer id){
        Admins byId = adminService.findById(id);
        return Message.success().add("admin",byId);
    }

    @RequestMapping("/update")
    @ResponseBody
    public Message update(Admins admins, MultipartFile file){
        if (file != null && file.getSize() > 0){
            String pic = FileLoad.uploadAdminPic(file);
            admins.setPic(pic);
        }
        int update = adminService.update(admins);
        if(update>0){
            return  Message.success();
        }else {
            return Message.fail();
        }
    }

    @RequestMapping("/delete")
    @ResponseBody
    public Message del(Integer id){
        int del = adminService.del(id);
        if(del>0){
            return Message.success();
        }else {
            return Message.fail();
        }
    }

    @RequestMapping("/admins")
    @ResponseBody
    public Message admins(@RequestParam(required = false) String adminName,@RequestParam("pn") Integer pageNum){
        Integer pageSize = 4;
        if(pageNum == null){
            pageNum = 1;
        }
        PageInfo<Admins> list = adminService.adminPage(adminName, pageNum, pageSize);
        return Message.success().add("pageInfo",list);
    }

    @RequestMapping("/admin")
    public String admin(){
        return "admin/admin";
    }

    @RequestMapping("/adopt")
    public String adopt(){
        return "admin/adopt";
    }

    @RequestMapping("/agree")
    public String agree(){
        return "admin/agree";
    }

    @RequestMapping("/apply")
    public String apply(){
        return "admin/apply";
    }

    @RequestMapping("/blog")
    public String blog(){
        return "admin/blog";
    }

    @RequestMapping("/comment")
    public String comment(){
        return "admin/comment";
    }

    @RequestMapping("/disAgree")
    public String disAgree(){
        return "admin/disAgree";
    }

    @RequestMapping("/pet")
    public String pet(){
        return "admin/pet";
    }

    @RequestMapping("/user")
    public String user(){
        return "admin/user";
    }

    /*管理员登录*/
    @RequestMapping("/login")
    public String login(){
        return "admin/login";
    }

    @RequestMapping("/dologin")
    public String doLogin(HttpSession session, String adminName,String adminPwd){
        Admins login = adminService.login(adminName, adminPwd);
        if (login == null){
            session.setAttribute("msg","用户名或密码错误！");
            return "redirect:/admin/login";
        }
            session.setAttribute("admin",login);
        return "redirect:/admin/admin";
    }

    @RequestMapping("/logout")
    public String logout(HttpSession session){
        session.invalidate();
        return "redirect:/admin/login";
    }

    @RequestMapping("/developing")
    public String developing(){
        return "admin/developing";
    }
    @RequestMapping("/applyShow")
    public String applyShow(){
        return "admin/applyShow";
    }


    @RequestMapping("/getApplyData")
    @ResponseBody
    public EchartsVO getApplyData(){
        List<ZhiChu> zhiChus = zhiChuService.selectList(null);
        return EchartsVO.success(zhiChus);
    }

    @RequestMapping(value = "/createMoney",method = RequestMethod.POST)
    @ResponseBody
    public ResponseVO createMoney(ZhiChu zhiChu){
        boolean insert = zhiChuService.insert(zhiChu);
        return ResponseVO.success(insert);
    }

    @RequestMapping("/findMoneyById")
    @ResponseBody
    public ResponseVO findMoneyById(Integer id){
        return ResponseVO.success(zhiChuService.findById(id));
    }

    @RequestMapping(value = "/updateMoneyById",method = RequestMethod.POST)
    @ResponseBody
    public ResponseVO updateMoneyById(@RequestBody ZhiChu zhiChu){
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(zhiChu.getTime());
        calendar.set(Calendar.DATE, calendar.get(Calendar.DATE) + 1);
        Date tomorrow = calendar.getTime();
        zhiChu.setTime(tomorrow);
        return ResponseVO.success(zhiChuService.updateById(zhiChu));
    }

    @RequestMapping(value = "/deleteMoneyById")
    @ResponseBody
    public ResponseVO updateMoneyById(Integer id){
        return ResponseVO.success(zhiChuService.deleteById(id));
    }

    @RequestMapping("/publishPage")
    public String publishPage(){
        return "admin/publish";
    }

    @RequestMapping("/getAllPublish")
    @ResponseBody
    public ResponseVO getAllPublish(){
        return ResponseVO.success(publishService.selectList(null));
    }
    @RequestMapping(value = "/updatePublishById",method = RequestMethod.POST)
    @ResponseBody
    public ResponseVO updatePublishById(@RequestBody Publish publish){
        return ResponseVO.success(publishService.updateById(publish));
    }
    @RequestMapping(value = "/delPublishById")
    @ResponseBody
    public ResponseVO delPublishById(Integer id){
        return ResponseVO.success(publishService.deleteById(id));
    }

    @RequestMapping(value = "/addMoneyById",method = RequestMethod.POST)
    @ResponseBody
    public ResponseVO addMoneyById(@RequestBody ZhiChu zhiChu){
        return ResponseVO.success(zhiChuService.insert(zhiChu));
    }


}
