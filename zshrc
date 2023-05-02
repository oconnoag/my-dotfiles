setopt PROMPT_SUBST  # Enables functions to be used in the prompt
autoload -U colors && colors  # Enables colors in the prompt
export NEWLINE=$'\n'
export parse_git_branch="git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'"
export PS1="${NEWLINE}%{$fg[white]%}%n@%{$fg[white]%}%m %{$fg[cyan]%}%~%{$reset_color%}%{$fg[yellow]%}\$(parse_git_branch)\${NEWLINE}%{$reset_color%}$ "
