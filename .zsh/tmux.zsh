unction ft() {
    local sessions=$(tmux list-sessions -F "#S" 2>/dev/null)
    local new_session_option="新規セッション作成"

    # 既存のセッションに新規セッション作成オプションを追加
    local all_options=($sessions $new_session_option)

    local session=$(printf '%s\n' "${all_options[@]}" | fzf --height=10 --reverse)
    [ -z "$session" ] && return

    if [ "$session" = "$new_session_option" ]; then
        echo -n "新しいセッション名を入力してください: "
        read new_session_name
        [ -z "$new_session_name" ] && return
        tmux -u new-session -s "$new_session_name"
    else
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
# if [[ ! -n $TMUX ]]; then
#     tmux_sessions=$(tmux ls 2>/dev/null | awk 'NR==1{print $1}' | sed 's/://')
#     if [[ -n $tmux_sessions ]]; then
#         echo "既存のTmuxセッションがあります。"
#         tmux attach-session -t "$tmux_sessions"
#     else
#         echo "新しいTmuxセッションを作成します。"
#         tmux new-session
#     fi
# fi
