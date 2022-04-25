package club.controller;

import club.pojo.AD;
import club.service.ADService;
import club.service.DonateService;
import club.vo.ResponseVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * @author Losca
 * @date 2022/4/25 15:54
 */
@RequestMapping("/ad")
@Controller
public class AdController {
    @Autowired
    ADService adService;
    @RequestMapping("/adPage")
    public String adPage(HttpSession session){
        List<AD> ads = adService.selectList(null);
        session.setAttribute("ads",ads);
        return "user/ad";
    }

    @RequestMapping("/adAdminPage")
    public String donatePage() {
        return "admin/ads";
    }

    @RequestMapping("/allAds")
    @ResponseBody
    public ResponseVO allMoney(@RequestParam(defaultValue = "1") Integer pageNum
            , @RequestParam(defaultValue = "8") Integer pageSize
            , @RequestParam String value){
        return ResponseVO.success(adService.list(pageNum,pageSize,value));
    }
    
    @RequestMapping(value = "/updateAd",method = RequestMethod.POST)
    @ResponseBody
    public ResponseVO updateAd(MultipartFile file,AD ad){
        String pic = FileLoad.uploadAdPic(file);
        ad.setPic(pic);
        return ResponseVO.success(adService.updateById(ad));
    }

    @RequestMapping(value = "/delAd")
    @ResponseBody
    public ResponseVO updateAd(Integer id){
        return ResponseVO.success(adService.deleteById(id));
    }
}
