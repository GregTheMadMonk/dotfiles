#!/bin/env bash

if [ -n "$WAYLAND_DISPLAY" ]
then
    echo "[ 1, 2, 3, 4, 5, 6, 7, 8, 9, 0 ]"
else
    echo "[ $(echo $(bspc query -D -m --names) | sed 's/ /, /g') ]"
fi
