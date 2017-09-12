#!/bin/bash
scrot /tmp/lock.png
convert /tmp/lock.png -resize 25% /tmp/lock-resize.png
convert /tmp/lock-resize.png -blur 0x3 /tmp/lock-blur.png
i3lock -f -i /tmp/lock-blur.png
