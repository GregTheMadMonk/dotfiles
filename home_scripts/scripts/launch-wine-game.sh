#!/bin/sh

if [ "$1" == "" ]; then
	GAME="$(ls /media/hdd/games | fzf)"
else
	GAME="$1"
fi

export WINEPREFIX="/media/hdd/games/$GAME"
run-game wine explorer
