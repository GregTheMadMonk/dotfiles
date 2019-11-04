#!/bin/sh

BL_DIR=/sys/class/backlight/intel_backlight
read NEW

MAX=$(cat $BL_DIR/max_brightness)
NOW=$(cat $BL_DIR/brightness)

NVAL=$(($NOW + $NEW * $MAX / 100))

if [ $NVAL -le 0 ]; then
	NVAL=0
fi

if [ $NVAL -ge $MAX ]; then
	NVAL=$MAX
fi

echo $NVAL > $BL_DIR/brightness
