#!/bin/sh

END_SESSION="1. Log out"
REBOOT="2. Reboot"
SHUTDOWN="3. Shut down"
CANCEL="4. Cancel"

ROFI='rofi -dmenu -separator-style none -bw 0 -disable-history -hide-scrollbar'

RESULT=$(echo -e "$END_SESSION\n$REBOOT\n$SHUTDOWN\n$CANCEL" | sh -c "$ROFI -mesg 'Pick an action'")

echo $RESULT

case $RESULT in
	$END_SESSION)
		echo "Exiting i3..."
		noaftodo -k
		i3-msg exit
		;;
	$REBOOT)
		[ $(echo -e "yes\nno" | sh -c "$ROFI -mesg 'Are you sure?'") = "yes" ] && (echo Rebooting...; systemctl reboot) || (echo Rebooting cancelled)
		;;
	$SHUTDOWN)
		[ $(echo -e "yes\nno" | sh -c "$ROFI -mesg 'Are you sure?'") = "yes" ] && (echo Shutting down...; systemctl poweroff) || (echo Shutdown cancelled)
		;;
	$CANCEL)
		echo "Cancel!"
		;;
esac
