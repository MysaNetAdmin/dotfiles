#!/bin/bash

IMAGE=/tmp/i3lock.png
SCREENSHOT="scrot $IMAGE"
BLURTYPE="8x8"

# Get the screenshot, add the blur and lock the screen with it
$SCREENSHOT
convert $IMAGE -blur $BLURTYPE $IMAGE
i3lock -i $IMAGE -e
