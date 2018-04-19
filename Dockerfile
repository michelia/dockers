
FROM ubuntu:16.04
RUN mv /etc/apt/sources.list /etc/apt/sources.list.bak
COPY sources.list /etc/apt/sources.list

RUN apt-get update
RUN apt-get install -y --assume-yes apt-utils
RUN apt-get install -y \
        sshpass \
        git \
        curl \
        wget \
        man \
        openssh-server \
        tree \
        lrzsz \
        net-tools \
        iputils-ping \
        cron \
        screen \
        vim \
        bzip2 \
        python \
        tzdata \
        locales

# 切换下面执行的目录
WORKDIR /root

# 安装 en_US.UTF-8
RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8
ENV TERM xterm

########## 执行个性化配置的安装
COPY bashrc.sh bashrc.sh 
RUN cat bashrc.sh >> .bashrc
RUN rm bashrc.sh

COPY init.sh init.sh 
RUN bash init.sh
RUN rm init.sh
# 时区  Asia/Shanghai
ENV TZ=Asia/Shanghai
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

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

# apt清理
RUN apt-get clean && \ 
    rm -rf /var/cache/apt/archives/* /var/lib/apt/lists/* /tmp/* /var/tmp/*

# /bin/bash /etc/rc.local 自动执行bash 相当于开机启动 (此开机指的是容器)
# /usr/sbin/sshd -D  启动 sshd
ENTRYPOINT /etc/rc.local && /usr/sbin/sshd -D
