#!/bin/env bash

if [ -n $WAYLAND_DISPLAY ]
then
    # Wayland stuff
    # Hyprland plugins
    hyprpm reload

    # Use way-displays for monitor management
    way-displays &

    # EWW for bars
    # TODO: Dynamically decide which goes where
    eww open bar      --arg mon=0 &
    eww open smallbar --arg mon=1 &

    # Dunst for notifications
    dunst &

    # Network manager applet
    nm-applet &

    # Flameshot in the background
    flameshot &
else
    # TODO
    echo Pass
fi
