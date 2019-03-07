#!/bin/bash
docker stop ceph-starter
docker rm   ceph-starter

#启动一个临时测试的web服务器
cd ..
ls -al helloworld.tar.gz
#current_file_path=$(cd "$(dirname "$0")"; pwd)
#filesource="file://${current_file_path}/helloworld.tar.gz"

#-v `pwd`/helloworld.tar.gz:/server/data/helloworld.tar.gz \

echo "需要安装rexray服务 需要把helloworld.tar.gz 拷贝到 ceph 存储指定位置上."

docker run -d --name ceph-starter \
--add-host download.cityworks.cn:192.168.66.36 \
--volume-driver rexray \
-v helloworld-data:/server/data \
-e "downloadURL=file:///server/data/helloworld.tar.gz" \
-p 81:8080 \
-m 1g \
--dns 114.114.114.114 \
common-docker-starter:openjdk-8u191-jdk-alpine3.8
