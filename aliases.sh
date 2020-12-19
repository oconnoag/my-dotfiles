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
alias c='clear'
alias grep='egrep --color=auto'  # Always color match
alias v='vim'
alias py='python'

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

# Enter into an docker container (EnterContainer)
# :param $1: container id (Get from docker container ls)
ec() {
    docker exec -it $1 /bin/bash
}

# Create unit testing module
# :param $1: Module name (Name of the module to create the unit testing)
unit_test() {
    mod_name=$1

    if [ -z ${mod_name} ]; then
        echo "[ERROR]: Must provide module name to create unit testing module -- no action performed"
    else
        cp ~/.dotfiles/templates/unit_test.py $1 && vim $1
    fi
}

# Create a python module complete with __init__.py file
# :param $1: New directory name
pydir() {
    dir_name=$1

    mkdir $1 && cd $1 && touch __init__.py
    echo "'$1' created with __init__.py"
}

# History grep
# :param $1: Grep pattern 
hg() {
    grep_pattern=$1
    history | egrep $1
}
