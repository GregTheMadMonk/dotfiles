#!/bin/sh

if [ "$1" == "" ]; then
	GAME="$(ls /media/hdd/games | rofi -dmenu)"
else
	GAME="$1"
fi

if [ "$GAME" == "" ]; then
	exit 1
fi

export WINEPREFIX="/media/hdd/games/$GAME"
nohup run-game wine explorer > /dev/null &
