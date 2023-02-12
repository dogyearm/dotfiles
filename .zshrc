autoload -Uz compinit && compinit -u
autoload -Uz colors && colors

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

if [ -f ~/.zsh/plugin.zsh ]; then
    source ~/.zsh/plugin.zsh
fi

# NOTE:
# - souce ~/.zsh/*.zsh
# - tmux window を S-j, S-k で移動
