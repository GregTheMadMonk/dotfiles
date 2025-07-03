#!/bin/sh
# xrandr --output DP-1 --off --output DisplayPort-1 --primary --mode 2560x1440 --pos 0x350 --rotate normal --rate 165 --output DisplayPort-2 --mode 1920x1080 --pos 2560x0 --rotate right --rate 165 --output HDMI-A-0 --off
# xrandr --output DP-1 --off --output DP-2 --primary --mode 2560x1440 --pos 0x350 --rotate normal --rate 165 --output DP-3 --mode 1920x1080 --pos 2560x0 --rotate right --rate 165 --output HDMI-A-0 --off
xrandr --output DP-3 --off --output DP-2 --primary --mode 2560x1440 --pos 0x350 --rotate normal --rate 165 --output DP-1 --mode 1920x1080 --pos 2560x0 --rotate right --rate 165 --output HDMI-A-0 --off
