function ft() {
   [ -n "$session" ] && tmux switch-client -t "$session"
    local sessions=$(tmux list-sessions -F "#S" 2>/dev/null)
    local new_session_option="++New"

    # 既存のセッションと新規セッション作成オプションを結合
    local all_options=($sessions "$new_session_option")

    local session=$(printf '%s\n' "${all_options[@]}" | fzf --height=10 --reverse)
    [ -z "$session" ] && return

    if [ "$session" = "$new_session_option" ]; then
        # 新規セッション作成
        tmux new-session
    else
        # 既存のセッションに切り替え
        tmux switch-client -t "$session"
    fi
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


