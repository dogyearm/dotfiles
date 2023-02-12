#!/bin/sh

# Install tmux
if ! type tmux >/dev/null 2>&1
then
  brew install tmux
fi

if [[ ! -f ~/.tmux ]]; then
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi

