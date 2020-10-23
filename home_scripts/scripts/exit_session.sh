#!/bin/sh

END_SESSION="1. Log out"
REBOOT="2. Reboot"
SUSPEND="3. Suspend"
SHUTDOWN="4. Shut down"
CANCEL="5. Cancel"

ROFI='rofi -dmenu -separator-style none -bw 0 -disable-history -hide-scrollbar'

RESULT=$(echo -e "$END_SESSION\n$REBOOT\n$SUSPEND\n$SHUTDOWN\n$CANCEL" | sh -c "$ROFI -mesg 'Pick an action'")

echo $RESULT

case $RESULT in
	$END_SESSION)
		echo "Exiting wm..."
		noaftodo -k
		i3-msg exit
		bspc quit
		;;
	$REBOOT)
		[ $(echo -e "yes\nno" | sh -c "$ROFI -mesg 'Are you sure?'") = "yes" ] && (echo Rebooting...; systemctl reboot) || (echo Rebooting cancelled)
		;;
	$SUSPEND)
		[ $(echo -e "yes\nno" | sh -c "$ROFI -mesg 'Are you sure?'") = "yes" ] && (echo Suspending...; systemctl suspend) || (echo Suspending cancelled)
		;;
	$SHUTDOWN)
		[ $(echo -e "yes\nno" | sh -c "$ROFI -mesg 'Are you sure?'") = "yes" ] && (echo Shutting down...; systemctl poweroff) || (echo Shutdown cancelled)
		;;
	$CANCEL)
		echo "Cancel!"
		;;
esac
