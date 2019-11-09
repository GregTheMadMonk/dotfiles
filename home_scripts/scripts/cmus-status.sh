#!/bin/bash

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
		POS=$(grep "position " <<< "$OUT" | awk '{print $2}')
		DUR=$(grep "duration " <<< "$OUT" | awk '{print $2}')
		POS_M=$(($POS/60))
		POS=$(($POS%60))

		DUR_M=$(($DUR/60))
		DUR=$(($DUR%60))
		echo $SIGN $(grep "tag artist " <<< "$OUT" | awk '{for (i=3; i <= NF; i++) print $i}') - $(grep "tag title " <<< "$OUT" | awk '{for (i=3; i <= NF; i++) print $i}') \($POS_M\:$POS\/$DUR_M\:$DUR\)
	fi
else
	echo "cmus is off"
fi
