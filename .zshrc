# install zinit
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
fi
source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

zinit light 'b4b4r07/ultimate'

# General
umask 022
limit coredumpsize 0
bindkey -e

# Aliases
alias gst='git status --short --branch'

# Prompto
setopt prompt_subst
PROMPT='%n$ '

# Local
[ ! -f ~/.zshrc.local ] && echo "# Local Setting" >> ~/.zshrc.local
source ~/.zshrc.local
