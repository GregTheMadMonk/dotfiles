#!/bin/bash

OUT=$(cmus-remote -Q 2>/dev/null)

if [ $? -eq 0 ]; then
	STATUS=$(grep "status " <<< "$OUT" | awk '{print $2}')
	if [ $STATUS = "stopped" ]; then
		echo "bruh"
	else
		if [ $STATUS = "playing" ]; then
			cmus-remote -u
		fi
		if [ $STATUS = "paused" ]; then
			cmus-remote -p
		fi
	fi
else
	$TERMINAL -e cmus
fi
