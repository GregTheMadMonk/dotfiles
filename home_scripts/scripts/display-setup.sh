#!/bin/sh
xrandr --output HDMI-1-1 --mode 1920x1080 --rate 140
xrandr --setprovideroutputsource modesetting NVIDIA-G0
xrandr --auto
