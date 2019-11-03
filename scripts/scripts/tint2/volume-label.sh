#!/bin/sh

pactl list sinks | grep -q Mute:.no && echo /usr/share/t2ec/vol-medium.svg || echo /usr/share/t2ec/vol-muted.svg
echo $(amixer get Master | grep "Front Left:" | awk '{print $5}' | sed 's/\[//g' | sed 's/\]//g')
