#!/bin/bash

INTERVAL=0.1

while [ true ]; do
OUT=$(cmus-remote -Q 2>/dev/null)
if [ $? -eq 0 ]; then
	STATUS=$(grep "status " <<< "$OUT" | awk '{print $2}')
	if [ $STATUS = "stopped" ]; then
		echo "not playing"
	else
		if [ $STATUS = "playing" ]; then
			SIGN=">"
		fi
		if [ $STATUS = "paused" ]; then
			SIGN="|"
		fi
		echo $SIGN $(grep "tag artist " <<< "$OUT" | awk '{for (i=3; i <= NF; i++) print $i}') - $(grep "tag title " <<< "$OUT" | awk '{for (i=3; i <= NF; i++) print $i}')
	fi
else
	echo "cmus is off"
fi
sleep $INTERVAL
done
