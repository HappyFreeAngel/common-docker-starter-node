#FROM node:11.11.0-alpine
FROM node:8.15.1-alpine
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g' /etc/apk/repositories
ADD starter.sh  /server/
RUN  apk update &&  apk add bash curl git tzdata  && chmod +x  /server/starter.sh && echo 'Asia/Shanghai' > /etc/timezone
ENV TZ='Asia/Shanghai'

EXPOSE 22/tcp 80/tcp 443/tcp
WORKDIR /server
CMD  ["/server/starter.sh", "-D", "FOREGROUND"]
#CMD [ "node" ]
