
FROM ubuntu:16.04
RUN mv /etc/apt/sources.list /etc/apt/sources.list.bak
COPY sources.list /etc/apt/sources.list

RUN apt-get update
RUN apt-get install -y \
        python3-dev \
        libfreetype6-dev \
        libjpeg-dev \
        libsqlite3-dev \
        libxml2-dev \
        libxslt-dev \
        git \
        curl \
        wget \
        sshpass \
        openssh-server \
        vim

COPY install.sh /root/install.sh 
COPY bashrc.sh /root/bashrc.sh 
# # 执行个性化配置的安装
RUN cd /root/ && bash install.sh

# 下载 Go
# ADD https://storage.googleapis.com/golang/go1.9.linux-amd64.tar.gz /root/go1.9.linux-amd64.tar.gz
COPY go1.9.linux-amd64.tar.gz /root/go1.9.linux-amd64.tar.gz

# 下载 Python
# ADD https://www.python.org/ftp/python/3.6.2/Python-3.6.2.tgz /root/Python-3.6.2.tgz
COPY Python-3.6.2.tgz /root/Python-3.6.2.tgz

#################################################
# 配置sshd环境
RUN mkdir /var/run/sshd
# 用户, 密码 都是 root
RUN echo 'root:root' | chpasswd
RUN sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

# SSH login fix. Otherwise user is kicked off after login
RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd

ENV NOTVISIBLE "in users profile"
RUN echo "export VISIBLE=now" >> /etc/profile

EXPOSE 22
#################################################

# CMD /bin/bash
CMD ["/usr/sbin/sshd", "-D"]

