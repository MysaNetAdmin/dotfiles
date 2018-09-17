#!/bin/bash

IMAGE=/tmp/i3lock.png
SCREENSHOT="scrot $IMAGE"
#BLURTYPE="2x8" # 2.90s
BLURTYPE="8x8" # 2.92s

# Get the screenshot, add the blur and lock the screen with it
$SCREENSHOT
convert $IMAGE -blur $BLURTYPE $IMAGE
i3lock -e -i $IMAGE -p default
