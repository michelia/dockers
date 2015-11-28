FROM elasticsearch:2.1
MAINTAINER michelia <github.com/michelia>

# 安装必要软件
RUN apt-get update \
    && apt-get upgrade
    && apt-get install -y vim less

# .bashrc中的快捷配置
RUN echo '

export TERM=xterm

alias ll='ls --group-directories-first -hlF --time-style=long-iso'
alias llx='ls --group-directories-first -hlFX --time-style=long-iso'
alias lll='ls --group-directories-first -hlLF --time-style=long-iso'
alias la='ls -A --group-directories-first --time-style=long-iso'
alias l='ls  --group-directories-first --time-style=long-iso -CF'
alias ln='ln -s'
alias le='less -S'
alias dul='du -sh *'
alias dua='du -sh'
alias psl='ps ux --sort=-%cpu | less -S'
alias psa='ps aux --sort=-%cpu | less -S'
' >> /root/.bashrc
