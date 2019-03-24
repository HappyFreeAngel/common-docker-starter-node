#!/bin/bash
docker stop node-starter
docker rm   node-starter

ls -al helloworld.tar.gz
docker run -d --name node-starter \
-e "PORT=80" \
-v `pwd`/helloworld.tar.gz:/server/data/helloworld.tar.gz \
-e "downloadURL=file:///server/data/helloworld.tar.gz" \
-p 1111:80 \
-p 2222:22 \
-m 128m \
--dns 10.20.5.31 \
--dns 114.114.114.114 \
common-docker-starter-node:alpine-support-ssh-login-1.0.0
