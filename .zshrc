# Install zinit
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
fi
source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Theme
zinit light b4b4r07/ultimate

# 使いづらいのでコメントアウト
# zinit light zsh-users/zsh-autosuggestions
zinit light zdharma-continuum/fast-syntax-highlighting # シンタックスハイライト
zinit ice proto'git' pick'init.sh'
zinit light b4b4r07/enhancd  # ディレクトリ検索
# zinit light zsh-abbrev-alias # パイプ先のコマンドを入力

# General
umask 022
limit coredumpsize 0
bindkey -e

# Aliases
alias gst='git status --short --branch'
alias vimf='vim $(fzf)'

# Prompto
setopt prompt_subst
PROMPT='%n$ '

###############
### fzf
###############

### チートシート
# Ctrl-t ... current 配下検索
# Ctrl-r ... 履歴検索
# Alt-c  ... カレントディレクトリ以下のディレクトリが表示され、選択したディレクトリにcd
export FZF_DEFAULT_COMMAND='rg --files --hidden --glob "!.git"'
export FZF_DEFAULT_OPTS='--height 40% --reverse --border'
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# git checkout branchをfzfで選択
alias fgo='git checkout $(git branch -a | tr -d " " |fzf --height 100% --prompt "CHECKOUT BRANCH>" --preview "git log --color=always {}" | head -n 1 | sed -e "s/^\*\s*//g" | perl -pe "s/remotes\/origin\///g")'

# fbr - checkout git branch
fbr() {
  local branches branch
  branches=$(git branch -vv) &&
  branch=$(echo "$branches" | fzf +m) &&
  git checkout $(echo "$branch" | awk '{print $1}' | sed "s/.* //")
}

# fbr - checkout git branch (including remote branches)
fbrr() {
  local branches branch
  branches=$(git branch --all | grep -v HEAD) &&
  branch=$(echo "$branches" |
           fzf-tmux -d $(( 2 + $(wc -l <<< "$branches") )) +m) &&
  git checkout $(echo "$branch" | sed "s/.* //" | sed "s#remotes/[^/]*/##")
}

# fshow - git commit browser
flog() {
  git log --graph --color=always \
      --format="%C(auto)%h%d %s %C(black)%C(bold)%cr" "$@" |
  fzf --ansi --no-sort --reverse --tiebreak=index --bind=ctrl-s:toggle-sort \
      --bind "ctrl-m:execute:
                (grep -o '[a-f0-9]\{7\}' | head -1 |
                xargs -I % sh -c 'git show --color=always % | less -R') << 'FZF-EOF'
                {}
FZF-EOF"
}

# fh - repeat history
fh() {
  eval $( ([ -n "$ZSH_NAME" ] && fc -l 1 || history) | fzf +s --tac | sed 's/ *[0-9]* *//')
}

# fkill - kill process
fkill() {
  local pid
  pid=$(ps -ef | sed 1d | fzf -m | awk '{print $2}')

  if [ "x$pid" != "x" ]
  then
    echo $pid | xargs kill -${1:-9}
  fi
}

# fd - cd to selected directory
fd() {
  local dir
  dir=$(find ${1:-.} -path '*/\.*' -prune \
                  -o -type d -print 2> /dev/null | fzf +m) &&
  cd "$dir"
}

# fda - including hidden directories
fda() {
  local dir
  dir=$(find ${1:-.} -type d 2> /dev/null | fzf +m) && cd "$dir"
}

# tm - create new tmux session, or switch to existing one. Works from within tmux too. (@bag-man)
# `tm` will allow you to select your tmux session via fzf.
# `tm irc` will attach to the irc session (if it exists), else it will create it.

tm() {
  [[ -n "$TMUX" ]] && change="switch-client" || change="attach-session"
  if [ $1 ]; then
    tmux $change -t "$1" 2>/dev/null || (tmux new-session -d -s $1 && tmux $change -t "$1"); return
  fi
  session=$(tmux list-sessions -F "#{session_name}" 2>/dev/null | fzf --exit-0) &&  tmux $change -t "$session" || echo "No sessions found."
}

###############
### zdharma-continuum/fast-syntax-highlighting
###############
# fast-theme -t safari

###############
### zsh-users/zsh-autosuggestion
###############
# ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=242'
# bindkey '^t' autosuggest-accept  # Tab
# bindkey '\hoge' autosuggest-clear
# bindkey '\hgoe' autosuggest-execute

###############
### b4b4r07/enhancd
### 高速 cd
### https://qiita.com/b4b4r07/items/2cf90da00a4c2c7b7e60#%E7%89%B9%E5%BE%B4
###############
export ENHANCD_FILTER=fzf
export ENHANCD_DISABLE_DOT=1
export ENHANCD_HOOK_AFTER_CD="ls"

###############
### Local
###############
[ ! -f ~/.zshrc.local ] && echo "# Local Setting" >> ~/.zshrc.local
source ~/.zshrc.local

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"
eval "$(pyenv init -)"
