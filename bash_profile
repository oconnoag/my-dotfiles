# Change colors of terminal (mac)
export CLICOLOR=YES
export LSCOLORS="Fxfxcxdxbxegedabagacad"

# Change colors (linux)
# LS_COLORS='rs=0:di=1;35;5;27:ln=1;36;5;51:mh=44;38;5;15:pi=40;38;5;11:so=38;5;13:do=38;5;5:bd=48;5;232;38;5;11:cd=48;5;232;38;5;3:or=48;5;232;38;5;9:mi=05;48;5;232;38;5;15:su=48;5;196;38;5;15:sg=48;5;11;38;5;16:ca=48;5;196;38;5;226:tw=48;'
# export LS_COLORS

# Vim keybinding
set -o vi

# Get git branch
parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

# Set Bash Prompt String
# PS1='\e[37;1m\u$(parse_git_branch):\e[35m\W\e[0m\$ ' # this will change your prompt format
export PS1="\[\033[1;37m\]\u@\h\[\033[00m\] \[\033[0;36m\]\W\[\033[33m\]\$(parse_git_branch)\[\033[00m\] $ "

# print title to tab
export PROMPT_COMMAND='echo -ne "\033]0;${PWD/#$HOME/~}\007"'

# Add my executables to the path
export PATH=$PATH:~/my_executables/

cd() {
    builtin cd "$@" && ls -F
}

# source fzf
fzf_script=~/.fzf.bash
[ -f ~/.fzf.bash ] && source ~/.fzf.bash || echo "Couldn't find $fzf_script"

# Set fzf to ripgrep and ignore
if type rg &> /dev/null; then
    export FZF_DEFAULT_COMMAND='rg --files --hidden --ignore-file=\*.pyc'
fi

# bashcompletion
# https://github.com/bobthecow/git-flow-completion/wiki/Install-Bash-git-completion#homebrew
[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"
