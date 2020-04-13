#!/bin/sh

ROFI='rofi -dmenu -separator-style none -font "mono 11" -bw 0 -disable-history -hide-scrollbar -color-window "#222222, #222222, #b1b4b3" -color-normal "#222222, #b1b4b3, #222222, #005577, #b1b4b3" -color-active "#222222, #b1b4b3, #222222, #007763, #b1b4b3" -color-urgent "#222222, #b1b4b3, #222222, #77003d, #b1b4b3"'

echo workspace $(sh -c "$ROFI") | xargs i3-msg
