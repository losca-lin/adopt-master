package club.service;

import club.pojo.Donate;
import club.pojo.ZhiLiao;
import com.baomidou.mybatisplus.service.IService;
import com.github.pagehelper.PageInfo;

/**
 * @author Losca
 * @date 2022/4/19 13:46
 */
public interface DonateService extends IService<Donate> {

    PageInfo list(Integer pageNum, Integer pageSize, String value);
}
