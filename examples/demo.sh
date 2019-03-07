#!/bin/bash
#确保shell 切换到当前shell 脚本文件夹
current_file_path=$(cd "$(dirname "$0")"; pwd)
cd ${current_file_path}

docker stop starter
docker rm   starter
#可以启动一个临时服务器
#sudo python -m SimpleHTTPServer 80 &

#启动一个临时测试的web服务器
ls -al helloworld.tar.gz

process_id_list=$(ps aux | grep -v 'SimpleHTTPServer' | awk '{print $2}')

for process_id in $process_id_list
  do
    kill $process_id
  done

nohup python -m SimpleHTTPServer 34567 &

docker run -d --name starter \
-e "PORT=80" \
-e "downloadURL=http://localhost:34567/helloworld.tar.gz" \
-p 81:80 \
-m 128m \
--dns 10.20.5.31 \
--dns 114.114.114.114 \
common-node-alpine:8.15.1-alpine
