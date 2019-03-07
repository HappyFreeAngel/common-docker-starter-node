#这是个通用的 docker启动器,可以动态启动node app
样本程序如下:

node app 项目根目录下可以添加run.sh 个性化你的启动过程.
不添加也可以。

#!/bin/bash
docker stop starter
docker rm   starter

#启动一个临时测试的web服务器
#current_file_path=$(cd "$(dirname "$0")"; pwd)
#filesource="file://${current_file_path}/helloworld.tar.gz"

docker run -d --name starter \
-e "PORT=80" \
-v `pwd`/helloworld.tar.gz:/server/data/helloworld.tar.gz \
-e "downloadURL=file:///server/data/helloworld.tar.gz" \
-p 81:80 \
-m 1g \
--dns 114.114.114.114 \
common-node-alpine:8.15.1-alpine
# common-docker-starter-node
# common-docker-starter-node
