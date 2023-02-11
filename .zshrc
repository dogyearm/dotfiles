umask 022
bindkey -e
PROMPT='%F{47}❯❯❯%f '
RPROMPT="%*"

alias g='git'
alias gst='git status --short --branch'
alias ga='git add'
alias gd='git diff'
alias gsh='git push'
alias gco='git checkout'
alias gco='git checkout'
alias ls='ls -G'
alias ll='ls -alF'
alias vimf='vim $(fzf)'
alias tm='tmux'
alias so='source ~/.zshrc'
alias pd='pwd'

setopt prompt_subst                  # use color
setopt nobeep                        # no beep
autoload -Uz compinit && compinit -u  # enable autocomplete
autoload -Uz colors && colors            # enable color for prompt
autoload -Uz add-zsh-hook
setopt auto_pushd                    # cd -
setopt auto_list
setopt list_packed
setopt correct                       # spellcheck
setopt interactive_comments          # comment
setopt auto_cd; function chpwd() { ls } # cd & ls

zstyle ':completion:*:default' menu select=2 # highlight autocomplete
zstyle ':completion:*' list-colors 'di=34' 'ln=35' 'so=32' 'ex=31' 'bd=46;34' 'cd=43;34' # 補完色付
zstyle ':completion:*' verbose yes
zstyle ':completion:*' format '%B%d%b'
zstyle ':completion:*:warnings' format 'No matches for: %d'
zstyle ':completion:*' group-name ''

setopt share_history           # 履歴を他のシェルとリアルタイム共有する
setopt hist_ignore_all_dups    # 同じコマンドをhistoryに残さない
setopt hist_ignore_space       # historyに保存するときに余分なスペースを削除する
setopt hist_reduce_blanks      # historyに保存するときに余分なスペースを削除する
setopt hist_save_no_dups       # 重複するコマンドが保存されるとき、古い方を削除する
setopt inc_append_history      # 実行時に履歴をファイルにに追加していく

# setup tmux
if [[ ! -n $TMUX ]]; then
  # get the IDs
  ID="`tmux list-sessions`"
  if [[ -z "$ID" ]]; then
    tmux new-session
  fi
  create_new_session="Create New Session"
  ID="$ID\n${create_new_session}:"
  ID="`echo $ID | $PERCOL | cut -d: -f1`"
  if [[ "$ID" = "${create_new_session}" ]]; then
    tmux new-session
  fi
  tmux attach-session -t "$ID"
fi

cd ~/src/github.com/dogyearm/dotfiles

# alias設定(zsh固有)
if [ -f ~/.zsh/.alias ]; then
    source ~/.zsh/.alias
fi

autoload -Uz fd
autoload -Uz fshow
autoload -Uz fbr
autoload -Uz fbrr
