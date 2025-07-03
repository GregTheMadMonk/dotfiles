#!/bin/env bash

if [ -n $WAYLAND_DISPLAY ]
then
    KB=$(hyprctl devices | grep 'main: yes' -B5 | head -1)
    case $1
    in
        "en")
            LANG=0
            ;;
        "ru")
            LANG=1
            ;;
        "gr")
            LANG=2
            ;;
        "fr")
            LANG=3
            ;;
    esac
    hyprctl switchxkblayout $KB $LANG
    notify-send -r 1024 "Layout switched: $1"
else
    # TODO
    echo Pass
fi
