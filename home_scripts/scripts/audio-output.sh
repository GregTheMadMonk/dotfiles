#!/bin/sh

ACTIVE=$(sh -c "pactl list sinks |& grep -E 'Sink|Ports|analog-ou' | grep Active | awk '{print \$3}'")

if [ $ACTIVE = "analog-output-speaker" ]; then
	echo Speaker
fi
if [ $ACTIVE = "analog-output-headphones" ]; then
	echo Headphones
fi
