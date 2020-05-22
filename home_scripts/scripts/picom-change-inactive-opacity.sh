#!/bin/sh

# === Verify `picom --dbus` status ===

if [ -z "$(dbus-send --session --dest=org.freedesktop.DBus --type=method_call --print-reply /org/freedesktop/DBus org.freedesktop.DBus.ListNames | grep compton)" ]; then
  stderr "picom DBus interface unavailable"
  if [ -n "$(pgrep picom)" ]; then
    stderr "picom running without dbus interface"
  else
    stderr "picom not running"
  fi
  exit 1
fi

# === Get connection parameters ===

dpy=$(printf "$DISPLAY" | tr -c '[:alnum:]' _)

if [ -z "$dpy" ]; then
  stderr "Cannot find display."
  exit 1
fi

service="com.github.chjj.compton.${dpy}"
interface="com.github.chjj.compton"
picom_dbus="dbus-send --print-reply --dest="${service}" / "${interface}"."
type_win='uint32'
type_enum='uint32'

# === Color Inversion ===

# Get window ID of window to invert
${picom_dbus}opts_set string:inactive_opacity "double:$1" &
exit 0
