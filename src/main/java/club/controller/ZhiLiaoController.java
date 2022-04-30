package club.controller;

import club.pojo.Visit;
import club.pojo.ZhiLiao;
import club.service.VisitService;
import club.service.ZhiLiaoService;
import club.vo.EchartsVO;
import club.vo.ResponseVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

/**
 * @author Losca
 * @date 2022/4/30 13:07
 */
@Controller
@RequestMapping("/zhiliao")
public class ZhiLiaoController {
    @Autowired
    ZhiLiaoService zhiLiaoService;

    @RequestMapping(value = "/addZhiLiao", method = RequestMethod.POST)
    @ResponseBody
    public ResponseVO addZhiLiao(@RequestBody ZhiLiao zhiLiao) {
        return ResponseVO.success(zhiLiaoService.insert(zhiLiao));
    }

    @RequestMapping(value = "/delZhiLiao")
    @ResponseBody
    public ResponseVO delZhiLiao(Integer id) {
        return ResponseVO.success(zhiLiaoService.deleteById(id));
    }

    @RequestMapping("/allZhiLiao")
    @ResponseBody
    public ResponseVO allZhiLiao(@RequestParam(defaultValue = "1") Integer pageNum
            , @RequestParam(defaultValue = "8") Integer pageSize
            , @RequestParam(defaultValue = "")String value) {
        return ResponseVO.success(zhiLiaoService.list(pageNum, pageSize, value));
    }

    @RequestMapping("/getTable")
    @ResponseBody
    public EchartsVO getTable(){
        return EchartsVO.success(zhiLiaoService.getTable());
    }


}
