#!/bin/bash
docker stop ceph-starter
docker rm   ceph-starter

#启动一个临时测试的web服务器
ls -al helloworld.tar.gz
echo "需要安装rexray服务 需要把helloworld.tar.gz 拷贝到 ceph 存储指定位置上."

docker run -d --name ceph-starter \
--volume-driver rexray \
-v helloworld-data-of-nodejs:/server/data \
-e "PORT=80" \
-e "downloadURL=file:///server/data/helloworld.tar.gz" \
-p 81:80 \
-m 128m \
--dns 10.20.5.31 \
--dns 114.114.114.114 \
common-node-alpine:8.15.1-alpine
