# install zinit
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
fi
source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

zinit light b4b4r07/ultimate  # Theme
zinit light zsh-users/zsh-autosuggestions # 補完
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

# fgを使わずctrl+zで行ったり来たりする
fancy-ctrl-z () {
  if [[ $#BUFFER -eq 0 ]]; then
    BUFFER="fg"
    zle accept-line
  else
    zle push-input
    zle clear-screen
  fi
}
zle -N fancy-ctrl-z
bindkey '^I' fancy-ctrl-z

###############
### Local
###############
[ ! -f ~/.zshrc.local ] && echo "# Local Setting" >> ~/.zshrc.local
source ~/.zshrc.local
