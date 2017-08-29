
FROM ubuntu:16.04
RUN mv /etc/apt/sources.list /etc/apt/sources.list.bak
COPY sources.list /etc/apt/sources.list

RUN apt-get update
RUN apt-get install -y \
        build-essential \
        checkinstall \
        gcc \
        locales \
        libffi-dev \
        libfreetype6-dev \
        libjpeg-dev \
        libmysqlclient-dev \
        libsqlite3-dev \
        libssl-dev \
        libxml2-dev \
        libxslt-dev \
        libxslt1-dev \
        make \
        python3-dev \
        sshpass \
        zlib1g-dev \
        git \
        curl \
        wget \
        man \
        openssh-server \
        zsh \
        autojump \
        tree \
        lrzsz \
        net-tools \
        iputils-ping \
        vim

# 安装 oh-my-zsh
RUN git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh \
    && cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc \
    && chsh -s /bin/zsh

RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8
ENV TERM xterm


WORKDIR /root

# 下载 Go
# ADD https://storage.googleapis.com/golang/go1.9.linux-amd64.tar.gz go1.9.linux-amd64.tar.gz
COPY go1.9.linux-amd64.tar.gz go1.9.linux-amd64.tar.gz

# 下载 Python
# ADD https://www.python.org/ftp/python/3.6.2/Python-3.6.2.tgz Python-3.6.2.tgz
COPY Python-3.6.2.tgz Python-3.6.2.tgz

# 执行个性化配置的安装
COPY init.sh init.sh 
COPY bashrc.sh bashrc.sh 
COPY zshrc.sh zshrc.sh
COPY zsh_prompt zsh_prompt

RUN bash init.sh
RUN cat bashrc.sh >> .bashrc
RUN cp zshrc.sh .zshrc
RUN rm bashrc.sh init.sh zshrc.sh zsh_prompt


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

# 相当于开机启动
ENTRYPOINT /etc/rc.local

# CMD /bin/bash
# 启动 sshd
CMD ["/usr/sbin/sshd", "-D"]
