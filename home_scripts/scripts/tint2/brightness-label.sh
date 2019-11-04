#!/bin/sh
DIR=/sys/class/backlight/intel_backlight

MAX=$(cat $DIR/max_brightness)
CUR=$(cat $DIR/brightness)

echo /usr/share/t2ec/bri-low.svg
echo $(($CUR * 100 / $MAX))%
