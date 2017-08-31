
export EDITOR=/usr/bin/vim
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8
export PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\] \n$ '

export PATH=$PATH:/usr/local/go/bin


# 常用命令别名
alias l="ls --color -hlF --time-style=long-iso --group-directories-first"
alias ls="ls --color -h --group-directories-first"
alias ll="ls --color -hlF --time-style=long-iso --group-directories-first"
alias lll="ls --color -hlLFa --time-style=long-iso --group-directories-first"
alias la="ls --color -A --group-directories-first --time-style=long-iso"
alias ln="ln -s"
alias le="less -S -i"
alias dul="du -sh *"
alias dua="du -sh"
alias h="history"
alias gopath="go env GOPATH"
alias psl='ps ux --sort=-%cpu | less -S'
alias psa='ps aux --sort=-%cpu | less -S'
alias hle="history | le"

# git alias
alias gs="git status"
alias ga="git add"
alias gc="git commit -v"
alias gcm="gc -m"
alias gpush="git push"
alias gpull="git pull"


# # git 代理
# alias gitproxy="cd /d/Files/authproxy; nohup ./authproxy64.exe &"

# # 日常环境
# alias getproxy="export http_proxy=http://127.0.0.1:7777; export https_proxy=http://127.0.0.1:7777"
# alias dev="cd /e/Dev"
# alias tcm="export GOPATH=/e/Dev/TCMDataBank-Demo-Golang; cd /e/Dev/TCMDataBank-Demo-Golang/src/ipxy/project/TCMDataBankDemo/"

# 加载 python env
source ~/pyenv/bin/activate



