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

# ls
alias gs='git status' alias ll='ls -la'

# git
alias gst='git status'

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
    # Menu select
    zmodload -i zsh/complist
    # bindkey -M menuselect '^h' vi-backward-char
    # bindkey -M menuselect '^j' vi-down-line-or-history
    # bindkey -M menuselect '^k' vi-up-line-or-history
    # bindkey -M menuselect '^l' vi-forward-char
    #bindkey -M menuselect '^k' accept-and-infer-next-history
fi
# source ~/.tmuxinator/tmuxinator.zsh
