#!/bin/bash
docker stop starter
docker rm   starter

ls -al helloworld.tar.gz
docker run -d --name starter \
-e "PORT=80" \
-v `pwd`/helloworld.tar.gz:/server/data/helloworld.tar.gz \
-e "downloadURL=file:///server/data/helloworld.tar.gz" \
-p 8090:80 \
-m 128m \
--dns 10.20.5.31 \
--dns 114.114.114.114 \
common-node-alpine:8.15.1-alpine
