umask 022
bindkey -e
PROMPT='%n$ '

alias gst='git status --short --branch'
alias vimf='vim $(fzf)'
alias ls='ls -G -w'
alias tm='tmux'
alias so='source ~/.zshrc'

setopt prompt_subst                  # use color
setopt nobeep                        # no beep
autoload -U compinit && compinit -u  # enable autocomplete
autoload colors && colors            # enable color for prompt
setopt auto_pushd                    # cd -
setopt auto_list
setopt list_packed
setopt auto_cd                       # auto cd
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
