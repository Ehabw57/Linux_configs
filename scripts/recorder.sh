#!/bin/bash
ffmpeg -f x11grab -s 1920x1080 -i :0.0 -f pulse -i default -c:v libx264 -preset fast -crf 23 -profile:v high -level:v 4.2 -c:a aac -b:a 192k -movflags +faststart uput.mp4

