# cqpicfinder-docker
包含[Tsuk1ko/cq-picsearcher-bot](https://github.com/Tsuk1ko/cq-picsearcher-bot)的Docker镜像，基于node:15镜像更改。
获取构建好的docker镜像：```docker pull kotorik/cqpicfinder-docker:latest```
## 行为
1.使用清华源与淘宝源下载依赖包
2.使用git下载最新的Tsuk1ko/cq-picsearcher-bot
3.安装npm包依赖并启动（包含sqlite3无法正常安装的解决方案）

## 使用
可以参考[compose/](https://github.com/KotoriK/cqpicfinder-docker/tree/master/compose)下的```docker-compose.yml```
容器会暴露```config.jsonc```给宿主机
