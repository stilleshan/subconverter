# subconverter
## 简介
subconverter 是基于原版 [[tindy2013/subconverter]](https://github.com/tindy2013/subconverter) 项目的修改版本.仅修改 **分组配置文件** 以解决以下问题.相关使用方法请参考官方项目.

- **增加**`Netflix`分组
- **去除**`自动选择 url-test`以解决连接数爆涨问题.
- **全球拦截** 增加`节点选择`,以满足`Google Analytics`等广告统计工具的访问需求.(新版本可能已解决此需求)
- **修改时区** 镜像默认时区为 Asia/Shanghai

## 更新
**2021-05-29** 更新从`0.6.4`版本起 docker 镜像同时支持 X86 和 ARM

## 部署
### docker 部署
```shell
docker run  -d --name=subconverter --restart=always -p 25500:25500 stilleshan/subconverter
```

### 免费提供订阅转换地址
```shell
https://subto.herokuapp.com/
```
具体使用教程请参考 [[tindy2013/subconverter]](https://github.com/tindy2013/subconverter)  官方项目

## Nginx反向代理
配置Nginx反向代理来为接口链接提供域名和 HTTPS 支持.配置参考如下,请自行替换`域名`和`证书`信息.

```nginx
upstream subconverter { 
    server 127.0.0.1:25500; # 端口改为docker容器提供的端口
}

server {
    listen 80;
    server_name  www.yourdomain.com;
    return 301 https://www.yourdomain.com$request_uri;
}

server {
    listen 443 ssl;
    server_name  www.yourdomain.com;
    gzip on;    

    ssl_certificate /usr/local/nginx/conf/ssl/www.yourdomain.com.crt;
    ssl_certificate_key /usr/local/nginx/conf/ssl/www.yourdomain.com.key;

    location / {
        proxy_redirect off;
        proxy_pass http://subconverter;

        proxy_set_header  Host                $http_host;
        proxy_set_header  X-Real-IP           $remote_addr;
        proxy_set_header  X-Forwarded-Ssl     on;
        proxy_set_header  X-Forwarded-For     $proxy_add_x_forwarded_for;
        proxy_set_header  X-Forwarded-Proto   $scheme;
        proxy_set_header  X-Frame-Options     SAMEORIGIN;

        client_max_body_size        100m;
        client_body_buffer_size     128k;

        proxy_buffer_size           4k;
        proxy_buffers               4 32k;
        proxy_busy_buffers_size     64k;
        proxy_temp_file_write_size  64k;
    }
}
```

## 相关链接
- GitHub [stilleshan/subconverter](https://github.com/stilleshan/subconverter)
- Docker [stilleshan/subconverter](https://hub.docker.com/r/stilleshan/subconverter)
- 原版项目Github [tindy2013/subconverter](https://github.com/tindy2013/subconverter)
- 原版项目docker [tindy2013/subconverter](https://hub.docker.com/r/tindy2013/subconverter)
