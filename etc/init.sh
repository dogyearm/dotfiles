#!/bin/sh

# Install Homebrew
if ! type brew >/dev/null 2>&1
then
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Install Git
if ! type git >/dev/null 2>&1
then
  brew install git
fi

# Install Zsh
if ! [ -x /usr/local/bin/zsh ] >/dev/null 2>&1
then
  brew install zsh
fi

# Tmux で必要
# brew install reattach-to-user-namespace
# brew install zplug

# Install rbenv
# brew install rbenv

# Install tmux
if ! type tmux >/dev/null 2>&1
then
  brew install tmux
fi

if [[ ! -f ~/.tmux ]]; then
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi

# Install fzf https://github.com/junegunn/fzf
if [[ ! -f ~/.fzf ]]; then
  git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
  ~/.fzf/install
fi

# Update fzf
# [ -f ~/.fzf ] && cd ~/.fzf && git pull && ./install

# Install ripgrep
# https://github.com/BurntSushi/ripgrep#installation
if ! [ -x /usr/local/bin/rg ] >/dev/null 2>&1
then
  brew install ripgrep
fi
