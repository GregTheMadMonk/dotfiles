#!/bin/sh

CUR="$($(mpc current || echo ded) 2&> /dev/null)"
case "$CUR" in
	"")
	echo "mpd not playing"
	exit
	;;
	"ded")
	echo "mpc or mpd not installed"
	exit
	;;
	*)
	N="$(echo $CUR | wc -c)"
	if [ $N -ge 43 ]; then
		CUR="$(echo $CUR | cut -b 1-40)..."
	fi
	echo "$CUR"`mpc | sed '1d;3,$d;s/\[.*\]//g;s/  */ | /g'`
	;;
esac
