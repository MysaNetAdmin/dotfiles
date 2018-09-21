#!/bin/bash

IMAGE="$(find $HOME/Images/Lockscreen/  | sort -u | shuf -n1)"

convert -pointsize 20 -fill white \
        -draw 'text 960,1080 "Type Password to Unlock"' "$IMAGE" "$IMAGE"

i3lock -i "$IMAGE" -e
