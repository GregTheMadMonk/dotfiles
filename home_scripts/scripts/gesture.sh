#!/bin/env bash
OLD=$(date --date "$(stat /tmp/gesture | grep Modify | sed 's/.*: \(.*\)/\1/g')" +%s)
TIM=$(($OLD + 1))
NOW=$(date +%s)

echo \"$OLD\" \"$TIM\" \"$NOW\"

export DISPLAY=:0

if [ $TIM -le $NOW ]
then
    echo "$@"
    $@
    touch /tmp/gesture
fi
