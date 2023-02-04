#!/bin/sh

case "$1" in
	"start")
		notify-send "Gamemode started"
		killall picom
		;;
	"end")
		notify-send "Gamemode ended"
		DISPLAY=:0 picom &
		;;
esac
