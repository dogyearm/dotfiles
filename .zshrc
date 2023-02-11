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
alias ls='ls -Gw'
alias tm='tmux'
alias vimf='vim $(fzf)'
alias so='source ~/.zshrc'
alias pd='pwd'

setopt prompt_subst                  # use color
setopt nobeep                        # no beep
autoload -U compinit && compinit -u  # enable autocomplete
autoload colors && colors            # enable color for prompt
setopt auto_pushd                    # cd -
setopt auto_list
setopt list_packed
setopt correct                       # spellcheck
setopt interactive_comments          # comment
setopt auto_cd; function chpwd() { ls } # cd & ls

zstyle ':completion:*:default' menu select=2 # highlight autocomplete
zstyle ':completion:*' list-colors 'di=34' 'ln=35' 'so=32' 'ex=31' 'bd=46;34' 'cd=43;34' # 補完色付

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt share_history           # 履歴を他のシェルとリアルタイム共有する
setopt hist_ignore_all_dups    # 同じコマンドをhistoryに残さない
setopt hist_ignore_space       # historyに保存するときに余分なスペースを削除する
setopt hist_reduce_blanks      # historyに保存するときに余分なスペースを削除する
setopt hist_save_no_dups       # 重複するコマンドが保存されるとき、古い方を削除する
setopt inc_append_history      # 実行時に履歴をファイルにに追加していく

cdpath=(
  $HOME/(N-/)
  $HOME/src/github.com/dogyearm(N-/)
  $cdpath
)

cd ~/src/github.com/dogyearm/dotfiles

# fd - cd to selected directory
fd() {
  local dir
  dir=$(find ${1:-.} -path '*/\.*' -prune \
                  -o -type d -print 2> /dev/null | fzf +m) &&
  cd "$dir"
}

# fshow - git commit browser
fshow() {
  git log --graph --color=always \
      --format="%C(auto)%h%d %s %C(black)%C(bold)%cr" "$@" |
  fzf --ansi --no-sort --reverse --tiebreak=index --bind=ctrl-s:toggle-sort \
      --bind "ctrl-m:execute:
                (grep -o '[a-f0-9]\{7\}' | head -1 |
                xargs -I % sh -c 'git show --color=always % | less -R') << 'FZF-EOF'
                {}
FZF-EOF"
}

# fbr - checkout git branch
fbr() {
  local branches branch
  branches=$(git branch -vv) &&
  branch=$(echo "$branches" | fzf +m) &&
  git checkout $(echo "$branch" | awk '{print $1}' | sed "s/.* //")
}

# fbrr - checkout git branch (including remote branches)
fbrr() {
  local branches branch
  branches=$(git branch --all | grep -v HEAD) &&
  branch=$(echo "$branches" |
           fzf-tmux -d $(( 2 + $(wc -l <<< "$branches") )) +m) &&
  git checkout $(echo "$branch" | sed "s/.* //" | sed "s#remotes/[^/]*/##")
}

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
