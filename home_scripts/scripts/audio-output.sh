#!/bin/sh

ACTIVE=$(sh -c "pactl list sinks | grep -E 'Sink|Ports|analog-ou' | grep Active | awk '{print \$3}'")

(echo $ACTIVE | grep -q analog-output-speaker) && (pactl list sinks | grep -q Mute:.no && echo  || echo )
(echo $ACTIVE | grep -q analog-output-headphones) && (pactl list sinks | grep -q Mute:.no && echo  || echo ﳌ)
