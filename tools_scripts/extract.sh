#!/bin/bash

# Directory to scan (you can set this to any directory path)
DIR="."

# Loop through all .mp4 files in the directory
find "$DIR" -type f -name "*.mp4" | while read -r FILE; do
    # Get the base name of the file (without the extension)
    BASENAME=$(basename "$FILE" .mp4)
    
    # Get the duration of the video in seconds
    DURATION=$(ffprobe -v error -select_streams v:0 -show_entries stream=duration \
    -of csv=p=0 "$FILE")
    
    # Generate a random time between 0 and the duration of the video
    RANDOM_TIME=$(shuf -i 1-$((${DURATION%.*} - 1)) -n 1)
    
    # Extract the thumbnail at the random time and save it as <video_name>.jpg
    ffmpeg -nostdin -ss "$RANDOM_TIME" -i "$FILE" -vframes 1 -q:v 2 "thumpnails/$BASENAME.jpg" >> /dev/null 2>&1
    
    echo "Thumbnail extracted for $FILE at $RANDOM_TIME seconds."
done
