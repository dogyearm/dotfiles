# install zinit
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
fi
source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

zinit light b4b4r07/ultimate                 # Theme
zinit light zsh-users/zsh-autosuggestions    # 補完
zinit light zdharma-continuum/fast-syntax-highlighting # シンタックスハイライト
zinit ice proto'git' pick'init.sh'
zinit light b4b4r07/enhancd  # ディレクトリ検索

# General
umask 022
limit coredumpsize 0
bindkey -e

# Aliases
alias gst='git status --short --branch'

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

###############
### zdharma-continuum/fast-syntax-highlighting
###############
# fast-theme -t safari

###############
### zsh-users/zsh-autosuggestion
###############
# ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=8'
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#0000ff,bg=cyan,bold,underline"
bindkey '\t' autosuggest-accept # タブで選択
# TODO:
# autosuggest-accept を中断
# あいまい検索に対応


###############
### b4b4r07/enhancd
### 高速 cd
### https://qiita.com/b4b4r07/items/2cf90da00a4c2c7b7e60#%E7%89%B9%E5%BE%B4
###############
export ENHANCD_FILTER=fzf
export ENHANCD_DISABLE_DOT=1
export ENHANCD_HOOK_AFTER_CD=ls


###############
### Local
###############
[ ! -f ~/.zshrc.local ] && echo "# Local Setting" >> ~/.zshrc.local
source ~/.zshrc.local
