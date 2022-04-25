package club.service;

import club.pojo.AD;
import club.pojo.ZhiLiao;
import com.baomidou.mybatisplus.service.IService;
import com.github.pagehelper.PageInfo;

/**
 * @author Losca
 * @date 2022/4/19 13:46
 */
public interface ADService extends IService<AD> {

    PageInfo list(Integer pageNum, Integer pageSize, String value);
}
