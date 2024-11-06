#!/bin/bash
# sets live wallpaper to my deesk

# Directory containing the animated wallpapers
SOURCE_DIR="/home/zerobors/Wallpaper/ani_wal"
# Cache file to store the last selected wallpaper
CACHE_FILE="$HOME/.cache/current_wallpaper"

# Check if the cache file exists 
if [ -f "$CACHE_FILE" ] && [ "$1" != "fzf" ]; then
    RAND_FILE=$(cat "$CACHE_FILE")
else
    # Select a file from the directory if cache is empty
    RAND_FILE="$(find "$SOURCE_DIR" -maxdepth 1 -type f -name '*.mp4' | fzf)"
    [ -z "$RAND_FILE" ] && exit  # Exit if no file selected
fi

# Check if mpv is running and kill it
if pgrep mpv > /dev/null; then
	killall mpv
	sleep 0.3
fi

# Launch xwinwrap with mpv playing the selected video
xwinwrap -g 1920x1280 -s -b -fs -st -sp -nf -ov -fdt -- mpv -wid WID --really-quiet --framedrop=vo --no-audio --loop --panscan="1.0" --no-osc "$RAND_FILE" > /dev/null 2>&1 &

# Update the cache with the selected wallpaper
echo "$RAND_FILE" > "$CACHE_FILE"

