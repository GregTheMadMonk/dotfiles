#!/bin/sh

exec 2>/dev/null

source ~/scripts/lib/stretch.sh

CUR1=$(mpc current || echo ded)
CUR="$CUR1"
case "$CUR" in
    "")
    CUR="mpd not playing"
    ;;
    "ded")
	CUR="mpc or mpd not installed"
    ;;
esac

case "$1" in
    "title")
    stretch "$CUR" 43
    ;;
    "index")
    stretch "$(mpc | sed -e '1d;3,$d;s/.*\(#[0-9]*\/[0-9]*\).*/\1/')" 7
    ;;
    "time")
    stretch "$(mpc | sed -e '1d;3,$d;s/.* \([0-9]*:[0-9]*\/[0-9]*:[0-9]*\).*/\1/')" 13
    ;;
    "percent")
    stretch "$(mpc | sed -e '1d;3,$d;s/.*(\([0-9]*\%\).*/\1/')" 4
    ;;
    "other")
    echo "$BEFORE$CUR$AFTER"`mpc | sed '1d;3,$d;s/\[.*\]//g;s/  */ | /g'`
    ;;
esac
