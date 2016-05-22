#          _
#  _______| |__  _ __ ___
# |_  / __| '_ \| '__/ __|
#  / /\__ \ | | | | | (__
# /___|___/_| |_|_|  \___|
#
#

umask 022
limit coredumpsize 0
bindkey -d

# autoload
autoload -U  run-help
autoload -Uz add-zsh-hook
autoload -Uz cdr
autoload -Uz colors; colors
autoload -Uz compinit; compinit -u
autoload -Uz is-at-least
autoload -Uz history-search-end
autoload -Uz modify-current-argument
autoload -Uz smart-insert-last-word
autoload -Uz terminfo
autoload -Uz vcs_info
autoload -Uz zcalc
autoload -Uz zmv
autoload     run-help-git
autoload     run-help-svk
autoload     run-help-svn

# prompt
setopt prompt_subst
precmd() { vcs_info }
PROMPT='%n$ '


# ls
alias gs='git status' alias ll='ls -la'

# git
alias gst='git status --short --branch'
alias glog='git log --graph --decorate --oneline'

# vimrc
alias ev='vi ~/dotfiles/.vimrc'

# tmux
alias tm='tmux'
alias tma='tmux attach'
alias tma0='tmux attach -t 0'
alias tma1='tmux attach -t 1'
alias tma2='tmux attach -t 2'
alias tml='tmux list-sessions'

zsh_zplug() {
    [[ -d ~/.zplug ]] || {
        git clone https://github.com/b4b4r07/zplug ~/.zplug
        source ~/.zplug/zplug
        zplug update --self
    }

    # For development
    source ~/.zplug/zplug

    has_plugin() {
        (( $+functions[zplug] )) || return 1
        zplug check "${1:?too few arguments}"
        return $status
    }

    zplug "b4b4r07/zplug"

    # Local loading
    # zplug "~/.modules",  from:local,  nice:1,  of:"*.sh"
    # zplug "~/.zsh",      from:local,  nice:2

    # Remote loading
    zplug "zsh-users/zsh-completions"
    zplug "zsh-users/zsh-history-substring-search"
    zplug "zsh-users/zsh-syntax-highlighting",  nice:19

    if ! zplug check --verbose; then
        printf "Install? [y/N]: "
        if read -q; then
            echo; zplug install
        else
            echo
        fi
    fi
    zplug load --verbose
}

zsh_startup() {
    zsh_zplug
}

if zsh_startup; then
    # Important
    zstyle ':completion:*:default' menu select=2

    # Completing Groping
    zstyle ':completion:*:options' description 'yes'
    zstyle ':completion:*:descriptions' format '%F{yellow}Completing %B%d%b%f'
    zstyle ':completion:*' group-name ''

    # Completing misc
    zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
    zstyle ':completion:*' verbose yes
    zstyle ':completion:*' completer _expand _complete _match _prefix _approximate _list _history
    zstyle ':completion:*:*files' ignored-patterns '*?.o' '*?~' '*\#'
    zstyle ':completion:*' use-cache true
    zstyle ':completion:*:*:-subscript-:*' tag-order indexes parameters

    # Directory
    zstyle ':completion:*:cd:*' ignore-parents parent pwd
    export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
    zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

    # default: --
    zstyle ':completion:*' list-separator '-->'
    zstyle ':completion:*:manuals' separate-sections true

    # Menu select
    zmodload -i zsh/complist
    #bindkey -M menuselect '^h' vi-backward-char
    #bindkey -M menuselect '^j' vi-down-line-or-history
    #bindkey -M menuselect '^k' vi-up-line-or-history
    #bindkey -M menuselect '^l' vi-forward-char
    #bindkey -M menuselect '^k' accept-and-infer-next-history
fi

# tmuxinator
# source ~/.zsh/tmuxinator.zsh

# rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init - zsh)"

# nodebrew
export PATH=$HOME/.nodebrew/current/bin:$PATH
