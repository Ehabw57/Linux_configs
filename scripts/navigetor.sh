SELECTED_DIR=$(find ~/* -maxdepth 2 -type d -o -type l  | fzf)
if [ -n "$SELECTED_DIR" ]; then
	if [ -n "$TMUX" ]; then
		cd "$SELECTED_DIR"
	else
		SESSION_NAME=$(basename "$SELECTED_DIR")
		tmux new -c "$SELECTED_DIR" -s "$SESSION_NAME" -A 
		fi
fi
