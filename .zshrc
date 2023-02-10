umask 022
bindkey -d
PROMPT='%n$ '

alias gst='git status --short --branch'
alias vimf='vim $(fzf)'
alias ll='ls -la'
alias tm='tmux'

cd ~/src/github.com/dogyearm

setopt prompt_subst                  # use color
setopt nobeep                        # no beep
autoload -U compinit && compinit -u  # enable autocomplete
autoload colors && colors            # enable color for prompt
setopt auto_list
setopt list_packed
setopt auto_cd                       # cd dir name
setopt correct                       # spellcheck

zstyle ':completion:*:default' menu select=1 # color
