#!/bin/sh

CUR="$(mpc current)"
if [ "$CUR" == "" ]; then
	echo "mpd not playing"
	exit
fi
N="$(echo $CUR | wc -c)"
if [ $N -ge 43 ]; then
	CUR="$(echo $CUR | cut -b 1-40)..."
fi
echo "$CUR"`mpc | sed '1d;3,$d;s/\[.*\]//g;s/  */ | /g'`
