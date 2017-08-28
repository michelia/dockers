
# 常用命令别名
alias l="ls --color -hlF --time-style=long-iso --group-directories-first"
alias ls="ls --color -h --group-directories-first"
alias ll="ls --color -hlF --time-style=long-iso --group-directories-first"
alias lll="ls --color -hlLFa --time-style=long-iso --group-directories-first"
alias la="ls --color -A --group-directories-first --time-style=long-iso"
alias ..="cd .."
alias ln="ln -s"
alias le="less -S -i"
alias dul="du -sh *"
alias dua="du -sh"
alias e="explorer ."
alias h="history"
alias gopath="go env GOPATH"
alias psl="ps aux"
alias hle="history | le"

# git alias
alias gs="git status"
alias ga="git add"
alias gc="git commit -v"
alias gcm="gc -m"
alias gpush="git push"
alias gpull="git pull"

# git 代理
alias gitproxy="cd /d/Files/authproxy; nohup ./authproxy64.exe &"

# 日常环境
alias getproxy="export http_proxy=http://127.0.0.1:7777; export https_proxy=http://127.0.0.1:7777"
alias dev="cd /e/Dev"
alias tcm="export GOPATH=/e/Dev/TCMDataBank-Demo-Golang; cd /e/Dev/TCMDataBank-Demo-Golang/src/ipxy/project/TCMDataBankDemo/"

