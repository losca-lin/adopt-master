package club.service;

import club.pojo.Publish;
import com.baomidou.mybatisplus.service.IService;

import java.util.List;

/**
 * @author Losca
 * @date 2022/4/19 13:46
 */
public interface PublishService extends IService<Publish> {

    List<Publish> getPublishData(Integer userId);
}
