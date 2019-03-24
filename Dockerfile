#FROM node:11.11.0-alpine
FROM node:8.15.1-alpine
MAINTAINER happy  <linyingjie@ascs.tech>
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g' /etc/apk/repositories
ADD starter.sh  /server/
ADD run_sshd.sh /
COPY rootfs /
RUN  apk update &&  apk add bash curl git tzdata  && chmod +x  /server/starter.sh && echo 'Asia/Shanghai' > /etc/timezone
ENV TZ='Asia/Shanghai'

EXPOSE 22/tcp 80/tcp 443/tcp

RUN apk add --no-cache openssh \
  && sed -i s/#PermitRootLogin.*/PermitRootLogin\ yes/ /etc/ssh/sshd_config \
  && echo "root:kaixin.com" | chpasswd

#运行指定的app
RUN rm -rf /var/cache/apk/*

# generate host keys if not present
RUN ssh-keygen -A
# do not detach (-D), log to stderr (-e), passthrough other arguments
#RUN exec /usr/sbin/sshd -D -e "$@"

WORKDIR /server
#CMD  ["/server/starter.sh", "-D", "FOREGROUND"]
ENTRYPOINT  ["/server/starter.sh", "-D", "FOREGROUND"]
