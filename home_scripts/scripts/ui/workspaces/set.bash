#!/bin/env bash

if [ -n "$WAYLAND_DISPLAY" ]
then
    [ $1 -eq 0 ] && WS=10 || WS=$1
    hyprctl dispatch split:workspace $WS
else
    # TODO
    bspc desktop -f ${1}.local
    echo Pass
fi
