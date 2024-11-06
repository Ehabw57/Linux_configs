tmux list-sessions > /dev/null && SELECTED_SESSION=$(tmux list-sessions -F "#{session_name}" | fzf)
if [ -n "$SELECTED_SESSION" ]; then
	if [ -n "$TMUX" ]; then
		tmux switch-client -t "$SELECTED_SESSION"
	else
		tmux attach -t "$SELECTED_SESSION"
	fi
fi
