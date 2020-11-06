#!/bin/sh

echo $BACKGROUND
FLAG=1
F=

while [ true ]; do
	ROUT="$(cmus-remote -Q)"
	FILE="$(grep "file " <<< "$ROUT" | sed "s/file\ //g")"
	DIR="$(dirname "$FILE")"
	DIR="$((echo "$DIR" | grep -q "cue://") && (echo "$DIR" | sed "s/cue:\/\///g" | sed 's/\/[^/]*$//g') || (echo "$DIR"))"
	echo "$DIR"
	if [ "$DIR" != "." ]; then
		COVER="/home/$USER/Pictures/.cover.temp.jpg"
		rm "$COVER"
		ARTIST="$(grep "tag artist " <<< "$ROUT" | sed "s/tag artist //g")"
		ALBUM="$(grep "tag album " <<< "$ROUT" | sed "s/tag album //g")"
		echo $ARTIST - $ALBUM
		curl "$(album-art "$ARTIST" "$ALBUM")" -o "$COVER"
		if [ $? -eq 0 ]; then
			if [ "$F" != "$DIR/$COVER" ]; then
				F="$COVER"
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
