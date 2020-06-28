#!/bin/sh

ACTIVE=$(sh -c "pactl list sinks | grep -E 'Sink|Ports|analog-ou' | grep Active | awk '{print \$3}'")

case $ACTIVE in
	analog-output-speaker)
		pactl list sinks | grep -q Mute:.no && echo  || echo 
		;;
	analog-output-headphones)
		pactl list sinks | grep -q Mute:.no && echo  || echo ﳌ
		;;
esac
