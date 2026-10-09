package com.quanxiaoha.xiaohashu.count.biz.config;

import org.apache.rocketmq.spring.autoconfigure.RocketMQAutoConfiguration;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Import;

/**
 * @description: TODO
 */
@Configuration
@Import(RocketMQAutoConfiguration.class)
public class RocketMQConfig {

}
