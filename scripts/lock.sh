#!/bin/bash
scrot -q 1 /tmp/lock.png 
convert /tmp/lock.png -blur 0x6 /tmp/lock-blur.png
i3lock -f -i /tmp/lock-blur.png
