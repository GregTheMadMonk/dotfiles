#!/bin/env bash

if [ -n "$WAYLAND_DISPLAY" ]
then
    echo $0 TODO
else
    bspc query -D -d focused --names
fi
