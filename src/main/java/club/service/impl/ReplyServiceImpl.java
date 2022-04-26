package club.service.impl;

import club.dao.ReplyMapper;
import club.dao.ZhiLiaoMapper;
import club.pojo.Reply;
import club.pojo.ZhiLiao;
import club.service.ReplyService;
import club.service.ZhiLiaoService;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * @author Losca
 * @date 2022/4/19 13:47
 */
@Service
public class ReplyServiceImpl extends ServiceImpl<ReplyMapper, Reply> implements ReplyService {
}
