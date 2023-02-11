umask 022
bindkey -e

PROMPT='%F{47}❯❯❯%f '
RPROMPT="%*"

setopt prompt_subst            # use color
setopt nobeep                  # no beep
setopt auto_pushd              # cd -
setopt auto_list
setopt list_packed
setopt correct                 # spellcheck
setopt interactive_comments    # comment
setopt auto_cd                 # auto cd
setopt share_history           # 履歴を他のシェルとリアルタイム共有する
setopt hist_ignore_all_dups    # 同じコマンドをhistoryに残さない
setopt hist_ignore_space       # historyに保存するときに余分なスペースを削除する
setopt hist_reduce_blanks      # historyに保存するときに余分なスペースを削除する
setopt hist_save_no_dups       # 重複するコマンドが保存されるとき、古い方を削除する
setopt inc_append_history      # 実行時に履歴をファイルにに追加していく

autoload -Uz compinit && compinit -u
autoload -Uz colors && colors

zstyle ':completion:*:default' menu select=2
zstyle ':completion:*' list-colors 'di=34' 'ln=35' 'so=32' 'ex=31' 'bd=46;34' 'cd=43;34'
zstyle ':completion:*' verbose yes
zstyle ':completion:*' format '%B%d%b'
zstyle ':completion:*:warnings' format 'No matches for: %d'
zstyle ':completion:*' group-name ''

if [ -f ~/.zsh/alias.zsh ]; then
    source ~/.zsh/alias.zsh
fi

if [ -f ~/.zsh/utils.zsh ]; then
    source ~/.zsh/utils.zsh
fi

if [ -f ~/.zsh/tmux.zsh ]; then
    source ~/.zsh/tmux.zsh
fi

if [ -f ~/.zsh/hook.zsh ]; then
    source ~/.zsh/hook.zsh
fi

if [ -f ~/.zsh/completion.zsh ]; then
    source ~/.zsh/completion.zsh
fi
