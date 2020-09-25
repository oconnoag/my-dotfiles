alias dot='cd ~/.dotfiles'
alias h='history'
alias ls='ls -F'
alias pinger='ping google.com'
alias sort_size='du -sch .[!.]* * | sort -k1h'
alias sourcer='source ~/.bash_profile'
alias vimf='vim $(fzf)'
alias vimmer='cd ~/.vim'
alias gs='git status'
alias ga='git add'
alias gc='git commit'
alias gb='git branch'

# Git checkout -- must provide branch
# :param $1: Branch name
gco() {
    branch=$1
    if [ -z $branch ]; then
        echo "[ERROR]: Must provide branch to checkout -- no action performed"
    else
        git checkout $branch
    fi
}

# Enter into an docker container 
# :param $1: container id (Get from docker container ls)
enter_container() {
    docker exec -it $1 /bin/bash
}
