#!/bin/sh

# pactl list sinks | grep -q Mute:.no || echo ""
echo $(amixer get Master | grep "Front Left:" | awk '{print $5}' | sed 's/\[//g' | sed 's/\]//g' | sed 's/\ //')
