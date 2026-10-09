package com.quanxiaoha.xiaohashu.note.biz.consumer;

import com.quanxiaoha.xiaohashu.note.biz.constant.MQConstants;
import com.quanxiaoha.xiaohashu.note.biz.constant.RedisKeyConstants;
import jakarta.annotation.Resource;
import lombok.extern.slf4j.Slf4j;
import org.apache.rocketmq.spring.annotation.RocketMQMessageListener;
import org.apache.rocketmq.spring.core.RocketMQListener;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Component;


/**
 * @description: 延时删除 Redis 已发布笔记列表缓存
 */
@Component
@Slf4j
@RocketMQMessageListener(consumerGroup = "xiaohashu_group_" + MQConstants.TOPIC_DELAY_DELETE_PUBLISHED_NOTE_LIST_REDIS_CACHE, // Group
        topic = MQConstants.TOPIC_DELAY_DELETE_PUBLISHED_NOTE_LIST_REDIS_CACHE // 消费的主题 Topic
        )
public class DelayDeletePublishedNoteListRedisCacheConsumer implements RocketMQListener<String>  {

    @Resource
    private RedisTemplate<String, Object> redisTemplate;

    @Override
    public void onMessage(String body) {
        Long userId = Long.valueOf(body);

        // 删除个人主页 - 已发布笔记列表缓存
        String publishedNoteListRedisKey = RedisKeyConstants.buildPublishedNoteListKey(userId);

        // 批量删除
        redisTemplate.delete(publishedNoteListRedisKey);
    }
}
