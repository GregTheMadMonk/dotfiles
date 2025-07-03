#!/bin/env bash

if [ -n $WAYLAND_DISPLAY ]
then
    hyprctl devices | grep 'main: yes' -B5 \
                    | grep keymap \
                    | sed 's/.*: \(..\).*/\1/' \
                    | tr '[:upper:]' '[:lower:]'
else
    setxkbmap -query | grep layout | sed -e 's/.* \\([a-z][a-z]\\).*/\\1/'
fi
