#!/bin/sh

echo $BACKGROUND
FLAG=1
F=

while [ true ]; do
	DIR="$(dirname "$(cmus-remote -Q | grep "file " | sed "s/file\ //g")")"
	DIR="$((echo "$DIR" | grep -q "cue://") && (echo "$DIR" | sed "s/cue:\/\///g" | sed 's/\/[^/]*$//g') || (echo "$DIR"))"
	echo "$DIR"
	if [ "$DIR" != "." ]; then
		COVER=$(ls -S "$DIR"/*.jpg | grep -i cover)
		if [ $? -ne 0 ]; then
			COVER=$(ls -S "$DIR"/*.jpg | grep -i front)
			if [ $? -ne 0 ]; then
				COVER=$(ls -S "$DIR"/*.jpg | grep -m1 .jpg)
			fi
		fi
		if [ $? -eq 0 ]; then
			if [ "$F" != "$DIR/$COVER" ]; then
				F=$COVER
				echo  Updating with $F
				magick -gravity Center $BACKGROUND \( "$F" -resize 490x490 \) $MASK -composite +antialias ~/Pictures/.tmp-desktop.png
				hsetroot -extend ~/Pictures/.tmp-desktop.png
			fi
			FLAG=1
		else
			if [ $FLAG -eq 1 ]; then
				FLAG=0
				echo Resetting...
				hsetroot -extend $BACKGROUND
			fi
		fi
	else
		if [ $FLAG -eq 1 ]; then
			FLAG=0
			echo Resetting...
			hsetroot -extend $BACKGROUND
		fi
	fi
	sleep 1
done
