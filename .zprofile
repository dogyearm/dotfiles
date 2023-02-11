export LANG="ja_JP.UTF-8"
export EDITOR="vim"
export HISTFILE=~/.zsh_history
export HISTSIZE=1000000
export SAVEHIST=1000000

# Settings for golang
export GOROOT=/usr/local/opt/go/libexec
export GOPATH=$HOME
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin

# Ssettings for dircolor
export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"

# Setting for rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# Setting for NodeJS
export PATH="$HOME/.nodebrew/current/bin:$PATH"
