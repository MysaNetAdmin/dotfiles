#!/bin/bash

IMAGE="$(find $HOME/Images/Lockscreen/  | sort -u | shuf -n1)"

i3lock -i "$IMAGE" -e
