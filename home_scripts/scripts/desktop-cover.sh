#!/bin/sh

echo $BACKGROUND
FLAG=1
F=

while [ true ]; do
	DIR=$(dirname "$(cmus-remote -Q | grep "file " | sed "s/file\ //g")")
	DIR=$((echo $DIR | grep -q "cue://") && (echo $DIR | sed "s/cue:\/\///g" | sed 's/\/[^/]*$//g') || (echo $DIR))
	echo $DIR
	if [ "$DIR" != "." ]; then
		COVER=$(ls "$DIR" | grep -i cover | grep -i .jpg)
		if [ $? -ne 0 ]; then
			COVER=$(ls "$DIR" | grep -i front | grep -i .jpg)
			if [ $? -ne 0 ]; then
				COVER=$(ls "$DIR" | grep -m1 jpg)
			fi
		fi
		if [ $? -eq 0 ]; then
			if [ "$F" != "$DIR/$COVER" ]; then
				F=$DIR/$COVER
				echo  Updating with $F
				magick -gravity Center $BACKGROUND \( "$F" -resize 490x490 \) $MASK -composite +antialias ~/Pictures/.tmp-desktop.png
				hsetroot -fill ~/Pictures/.tmp-desktop.png
			fi
			FLAG=1
		else
			if [ $FLAG -eq 1 ]; then
				FLAG=0
				echo Resetting...
				hsetroot -fill $BACKGROUND
			fi
		fi
	else
		if [ $FLAG -eq 1 ]; then
			FLAG=0
			echo Resetting...
			hsetroot -fill $BACKGROUND
		fi
	fi
	sleep 1
done
