#!/bin/sh

OUTPUTS="$(xrandr -q | grep '[^dis]connected' | sed 's/\ .*//g')"

NOUTPUTS=$(echo -e "$OUTPUTS" | wc -l)

echo -e $OUTPUTS
echo -e NUM: $NOUTPUTS

WS=0

WSPSCR=$((10 / $NOUTPUTS))
WSST=0

echo Workspaces per screen: $WSPSCR

MAIN_WS=

for O in $OUTPUTS; do
	WSS=1
	WSC=1
	WSST=1

	while (($WSC < $WSPSCR)); do
		WSST=$(($WSST + 1))
		WSS="$WSS $WSST"
		WSC=$(($WSC+1))
	done;

	echo $O" -> "$WSS

	if [ "$O" == "eDP-1-1" ]; then
		echo Main monitor
		MAIN_WS=$WSS
	else
		bspc monitor $O -d $WSS
	fi
done

while (($WSST < 10)); do
	WSST=$(($WSST+1))
	MAIN_WS="$MAIN_WS $WSST"
done
echo "eDP-1-1 -> $MAIN_WS"
bspc monitor eDP-1-1 -d $MAIN_WS
