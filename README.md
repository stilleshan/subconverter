# subconverter
## 简介
基于 [tindy2013/subconverter](https://github.com/tindy2013/subconverter)[stilleshan/subconverter](https://github.com/stilleshan/subconverter)  项目的 docker 镜像.仅修改 **分组配置文件** 以解决以下问题.

- **增加**`Netflix，DisneyPlus`等分组.
- **修改时区** 镜像默认时区为 Asia/Shanghai



## 部署
### docker
```shell
docker run  -d --name=subconverter --restart=always -p 25500:25500 iliil/subconverter
```

### docker compose
下载 [docker-compose.yml](https://raw.githubusercontent.com/stilleshan/dockerfiles/main/subconverter/docker-compose.yml) 执行以下命令启动:
```shell
docker-compose up -d
```

### subweb + subconverter 合并进阶版
详情查看 [stilleshan/sub](https://github.com/stilleshan/dockerfiles/tree/main/sub)

## 链接
- [stilleshan/sub](https://github.com/stilleshan/dockerfiles/tree/main/sub)
- [stilleshan/subweb](https://github.com/stilleshan/subweb)
- [stilleshan/subconverter](https://github.com/stilleshan/subconverter)
- [tindy2013/subconverter](https://github.com/tindy2013/subconverter)
