package club.service;

import club.pojo.Visit;
import club.pojo.ZhiLiao;
import com.baomidou.mybatisplus.service.IService;
import com.github.pagehelper.PageInfo;

/**
 * @author Losca
 * @date 2022/4/19 13:46
 */
public interface VisitService extends IService<Visit> {

    PageInfo list(Integer pageNum, Integer pageSize, String value);
}
