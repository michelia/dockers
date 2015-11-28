FROM elasticsearch:2.1
MAINTAINER michelia <github.com/michelia>
# RUN /usr/share/elasticsearch/bin/plugin -i elasticsearch/marvel/latest
# RUN \
#     && export ES_HOME=/usr/share/elasticsearch  \
#     && cd $ES_HOME  \
#     && bin/plugin -i elasticsearch/marvel/latest
# RUN plugin install license
# RUN plugin install marvel-agent

RUN apt-get update \
    && apt-get install -y vim less
    
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
