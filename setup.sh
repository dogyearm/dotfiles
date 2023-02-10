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

# Symlink
ln -snfv "$HOME"/src/github.com/dogyearm/dotfiles/.zshrc "$HOME"/.zshrc
ln -snfv "$HOME"/src/github.com/dogyearm/dotfiles/.zshenv "$HOME"/.zshenv
ln -snfv "$HOME"/src/github.com/dogyear/dotfiles/.vimrc "$HOME"/.vimrc
ln -snfv "$HOME"/src/github.com/dogyear/dotfiles/.tmux.conf "$HOME"/.tmux.conf
ln -snfv "$HOME"/src/github.com/dogyear/dotfiles/.gitconfig "$HOME"/.gitconfig
ln -snfv "$HOME"/src/github.com/dogyear/dotfiles/.gitignore "$HOME"/.gitignore
