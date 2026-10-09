# 小哈书本地中间件

这套配置对应项目当前代码所需的本地服务：MySQL、Redis、Nacos、MinIO、Cassandra、Zookeeper、RocketMQ、Elasticsearch、Canal、XXL-JOB 和 Sentinel。

业务和管理端口默认只绑定到 `127.0.0.1`，用于本机学习开发，不应直接部署到公网。RocketMQ Broker 的 `10909/10911/10912` 例外绑定到 VMware 仅主机网卡 `192.168.134.1`，供 Windows 上的 Java 服务和 Docker 内的控制台共同访问，不绑定 WLAN 网卡。

## 地址

| 服务 | 本机地址 |
| --- | --- |
| MySQL | `127.0.0.1:3307` |
| Redis | `127.0.0.1:6379` |
| Nacos | `http://127.0.0.1:8848/nacos/` |
| MinIO API / 控制台 | `http://127.0.0.1:9000` / `http://127.0.0.1:9090` |
| Cassandra | `127.0.0.1:9042` |
| Zookeeper | `127.0.0.1:2181` |
| RocketMQ NameServer / 控制台 | `127.0.0.1:9876` / `http://127.0.0.1:8180` |
| Elasticsearch / Head / Kibana | `http://127.0.0.1:9200` / `http://127.0.0.1:9100` / `http://127.0.0.1:5601` |
| Canal | `127.0.0.1:11111` |
| XXL-JOB | `http://127.0.0.1:7777/xxl-job-admin/` |
| Sentinel | `http://127.0.0.1:8060/` |

本机实际使用的 `docker-compose.local.yml`、密码和 `.env` 不提交到 Git。其他机器请先将 `docker-compose.example.yml` 复制为 `docker-compose.local.yml`，填写本机凭据，并调整 Windows 数据目录和 RocketMQ 网卡地址。Redis、MinIO 和 Canal 的运行时凭据由本地环境注入，其余数据使用 Docker 卷保存。仓库里的示例配置不包含真实密码。

## Cassandra 评论表

首次初始化或清空 Cassandra 数据卷后，执行：

```powershell
Get-Content .\cassandra\comment-content.cql -Raw | docker exec -i xiaohashu-cassandra cqlsh
```
