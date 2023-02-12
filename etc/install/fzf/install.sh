#!/bin/sh

# Install fzf https://github.com/junegunn/fzf
if [[ ! -f ~/.fzf ]]; then
  git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
  ~/.fzf/install
fi

