#!/bin/sh
DIR=/sys/class/backlight/intel_backlight

MAX=$(cat $DIR/max_brightness)
CUR=$(cat $DIR/brightness)

echo $(($CUR * 100 / $MAX))%
