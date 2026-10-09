# 小哈书 · xiaohashu2

Java 微服务社区学习项目，包含用户、笔记、关注、评论、搜索、计数及数据对齐等服务。当前仓库用于源码管理与学习记录，不代表已完成生产部署或生产环境验证。

## 环境与技术栈

- JDK 17、Maven 3.x、Spring Boot 3.0.2、Spring Cloud Alibaba。
- Nacos、Gateway、OpenFeign、Sa-Token、MyBatis、MySQL。
- Redis、Caffeine、RocketMQ、Cassandra、Leaf、ZooKeeper。
- MinIO / 阿里云 OSS、Elasticsearch、Canal、XXL-JOB。

## 项目结构

| 模块 | 职责 |
| --- | --- |
| `xiaoha-framework` | 通用组件、上下文、日志、序列化及异常处理 |
| `xiaohashu-gateway` | 路由、鉴权及用户信息透传 |
| `xiaohashu-auth` | 登录、验证码及认证 |
| `xiaohashu-user` | 用户资料 |
| `xiaohashu-note` | 笔记与互动 |
| `xiaohashu-user-relation` | 关注、取关及关系列表 |
| `xiaohashu-comment` | 评论与回复 |
| `xiaohashu-count` | 计数汇总 |
| `xiaohashu-data-align` | 定时计数校对 |
| `xiaohashu-search` | 搜索与索引同步 |
| `xiaohashu-oss` | 文件存储 |
| `xiaohashu-kv` | 短文本存储 |
| `xiaohashu-distributed-id-generator` | 分布式 ID |
| `infra` | 本地中间件示例、索引映射及已整理的初始化 SQL |

## 配置与构建

真实开发配置保留在本机并由 `.gitignore` 排除，不随仓库上传。

1. 在各模块资源目录中，将 `application-dev.example.yml` 复制为同目录的 `application-dev.yml`，填写所有 `REPLACE_WITH_LOCAL_VALUE` 占位符。
2. 网关将 `application.example.yml` 复制为 `application.yml`；Leaf 将 `leaf.example.properties` 复制为 `leaf.properties`。其他 `.example` 文件同样按需复制并填写本机信息。
3. 配置 Nacos 命名空间和各服务对应的数据源、Redis、RocketMQ、KV、对象存储等连接。需要在 Nacos 中配置的内容不自动由 GitHub 同步。
4. 参考 [本地中间件说明](infra/README.md)。MySQL 示例使用宿主机端口 **3307**，不会占用原项目的 3306。
5. 在项目根目录执行 `mvn -DskipTests package`。完整运行还需要可用的中间件、匹配的业务表结构和本地配置；仅上传仓库并不会启动服务。

`infra/mysql` 中的脚本是当前已经整理的初始化与补充脚本，不能仅凭这些文件假设所有业务表已齐全。请结合教程及实际模块核对结构后初始化数据库。

中间件配置针对本机学习环境，包含本地数据目录和网络设置；在其他电脑运行前必须调整，不应直接暴露到公网。

## 安全与来源

- 不提交真实密码、云服务密钥、私钥、日志、数据库备份、IDE 配置和构建产物。
- 示例中的占位符需要在本机填写，不能作为生产凭据使用。
- 项目学习资料来源：[犬小哈教程](https://www.quanxiaoha.com/column/)。保留现有源码的来源与版权信息；私有仓库不意味着取得原始教程代码的公开分发许可。
