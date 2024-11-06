#!/bin/bash
# create all my .config and links them to my config repo
# Author: Ehab Hegazy


find  ./.config -maxdepth 1 -type d | while IFS= read -r DIRO; do
    BASENAME=$(basename "$DIRO")
    
    # Skip the current directory (i.e., ./config itself)
    if [ "$BASENAME" = ".config" ]; then
        continue
    fi
    
    # Check if the directory exists in ~/.config, if so, remove it
    if [ -d ~/.config/"$BASENAME" ]; then
        rm -r ~/.config/"$BASENAME"
    fi
    
    # Create the symlink
    ln -s "$DIRO" ~/.config/"$BASENAME"
done

cat ./packgaes.txt | xargs sudo xbps-install -y

