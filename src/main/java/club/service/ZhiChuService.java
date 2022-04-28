package club.service;

import club.pojo.ZhiChu;
import com.baomidou.mybatisplus.service.IService;
import com.github.pagehelper.PageInfo;

import java.util.ArrayList;

/**
 * @author Losca
 * @date 2022/4/19 13:46
 */
public interface ZhiChuService extends IService<ZhiChu> {



    PageInfo<ZhiChu> zhiChuPage(String adminName, Integer pageNum, Integer pageSize);

    ZhiChu findById(Integer id);

    PageInfo<ZhiChu> list(Integer pageNum, Integer pageSize, String value);

    boolean saveBatch(ArrayList<ZhiChu> list);

    int getProfit(String format);
}
