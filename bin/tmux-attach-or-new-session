#!/bin/zsh

function tmux-attach-or-new-session() {
  local session=$(__tmux_session_name)
  tmux attach -t $session > /dev/null 2>&1
  if [ $? -ne 0 ]; then
    tmux new -s $session
  fi
}

function __tmux_session_name() {
  echo ${$(basename $(pwd))//./_}
}
