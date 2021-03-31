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

# Print out a dynamic PWD with the first couple of dir names removed 
# See https://stackoverflow.com/questions/5687446/how-can-i-shortern-my-command-line-prompts-current-directory 
# for more info
export shorter_pwd='$(echo -n "${PWD}" | sed "s/\/Users\/aoconnor\/Documents\/AlijahProjects/.../g")'

# If there is an apostrophe in the hostname (like when my last name is included), remove it
# https://stackoverflow.com/a/24509305/9829163
export better_hostname='$(hostname) | sed "s/'\''//g"'

# Set Bash Prompt String
# export PS1="\n\[\033[1;37m\]\u@\h\[\033[00m\] \[\033[0;36m\]\w\[\033[33m\]\$(parse_git_branch)\[\033[00m\]\n$ "  # This one uses the \w to print the whole pwd path in the prompt
export PS1='\n\[\033[1;37m\]\u@$(eval "echo ${better_hostname}")\[\033[00m\] \[\033[0;36m\]$(eval "echo ${shorter_pwd}")\[\033[33m\]$(parse_git_branch)\[\033[00m\]\n$ '

# print title to tab
export PROMPT_COMMAND='echo -ne "\033]0;${PWD/#$HOME/~}\007"'

# Add my executables to the path
export PATH=$PATH:~/my_executables/

# Make it so that we see the directory contents when cd-ing in
cd() {
    builtin cd "$@" && ls -F
}

# source fzf
fzf_script=~/.fzf.bash
if [ -f ~/.fzf.bash ]; then 
    source ~/.fzf.bash
elif type fzf &> /dev/null; then
    :  # Do nothing
else
    echo "Couldn't find $fzf_script"
fi

# Set fzf to ripgrep and ignore
if type rg &> /dev/null; then
    export FZF_DEFAULT_COMMAND='rg --files --hidden --ignore-file=\*.pyc';
else
    echo "Couldn't find ripgrep"
fi

# bashcompletion
# https://github.com/bobthecow/git-flow-completion/wiki/Install-Bash-git-completion#homebrew
if [ -r "/usr/local/etc/profile.d/bash_completion.sh" ]; then  
    . "/usr/local/etc/profile.d/bash_completion.sh"
else
    echo "Couldn't find bash_completion"
fi

figlet "Sourcing complete!"
