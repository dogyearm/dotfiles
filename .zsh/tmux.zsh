function ft() {
    local sessions=$(tmux list-sessions -F "#S" 2>/dev/null)
    local new_session_option="新規セッション作成"

    # 既存のセッションに新規セッション作成オプションを追加
    local all_options=($sessions $new_session_option)

    local session=$(printf '%s\n' "${all_options[@]}" | fzf --height=10 --reverse)
    [ -z "$session" ] && return

    if [ "$session" = "$new_session_option" ]; then
        # 新規セッション作成時にセッション名を尋ねる
        echo -n "新しいセッション名を入力してください: "
        read new_session_name
        [ -z "$new_session_name" ] && return
        tmux new-session -s "$new_session_name"
    else
        # 既存のセッションに切り替え
        tmux switch-client -t "$session"
    fi
}

# Tmuxのセッションを終了する
function trm() {
    local sessions=$(tmux list-sessions -F "#S" 2>/dev/null)
    local session=$(printf '%s\n' "${sessions[@]}" | fzf --height=10 --reverse)
    [ -z "$session" ] && return

    tmux kill-session -t "$session"
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


