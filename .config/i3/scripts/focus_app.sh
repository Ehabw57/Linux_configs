#!/bin/bash
get_window_class () {
	WNIDOW_PID=$(pgrep -x "$1" | head -1) 2>> /home/zerobors/focus.log
	WINDOW_ID=$(xdotool search -pid "$WNIDOW_PID") 2>> /home/zerobors/focus.log
	xprop -id "$WINDOW_ID" WM_CLASS | awk -F '\"' '{print $4}' 2>> /home/zerobors/focus.log

}

if [ -z "$1" ]; then
    echo "Usage: $0 <window-title>" >> /home/zerobors/focus.log
    exit 1
fi

if pgrep "$1" >> /dev/null; then
	WINDOW_ID=$(get_window_class "$1")
	if [ -z "$WINDOW_ID" ]; then
        notify-send -u critical -t 3000 -i dialog-error "Error" "could not locate window class"
		echo "Error" "could not locate window class of $1" >> /home/zerobors/focus.log
		exit 2
	fi
	i3-msg "[class=^$WINDOW_ID]" focus >> /dev/null
	notify-send -u normal -t 3000 -i dialog-information "Switched" "You switched to $1"
	echo "[Switched]" " switched to app {$1}  of class {$WINDOW_ID}" >> /home/zerobors/focus.log
else
	"$1" > /dev/null 2>&1 &
    notify-send -u normal -t 3000 -i dialog-information "Opened" "You opened $1"
	echo "[Opend]" " opend app {$1}" >> /home/zerobors/focus.log
fi
