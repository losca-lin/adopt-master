package club.service;

import club.pojo.ZhiLiao;
import club.pojo.ZhiLiaoTable;
import com.baomidou.mybatisplus.service.IService;
import com.github.pagehelper.PageInfo;

import java.util.List;

/**
 * @author Losca
 * @date 2022/4/19 13:46
 */
public interface ZhiLiaoService extends IService<ZhiLiao> {

    PageInfo list(Integer pageNum, Integer pageSize, String value);

    List<ZhiLiaoTable> getTable();
}
