function ft() {
    local sessions=$(tmux list-sessions -F "#S" 2>/dev/null)
    [ -z "$sessions" ] && return

    local session=$(echo "$sessions" | fzf --height=10 --reverse)
    [ -n "$session" ] && tmux switch-client -t "$session"
}

# Tmuxのセットアップ
if [[ ! -n $TMUX ]]; then
    tmux_sessions=$(tmux ls 2>/dev/null)
    if [[ -n $tmux_sessions ]]; then
        echo "既存のTmuxセッションがあります。"
        ft
    else
        tmux new-session
    fi
else
    echo "既にTmuxセッション内です。"
fi

