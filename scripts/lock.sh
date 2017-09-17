#!/bin/bash
scrot -q 1 /tmp/lock.png 
echo "scrot"
convert /tmp/lock.png -blur 0x6 /tmp/lock-blur.png
echo "blur"
i3lock -f -i /tmp/lock.png
