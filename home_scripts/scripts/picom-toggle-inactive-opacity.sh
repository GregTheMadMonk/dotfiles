#!/bin/sh

# == Declare stderr function ===

stderr() {
  printf "\033[1;31m%s\n\033[0m" "$@" >&2
}

# === Verify `picom --dbus` status ===

if [ -z "$(dbus-send --session --dest=org.freedesktop.DBus --type=method_call --print-reply /org/freedesktop/DBus org.freedesktop.DBus.ListNames | grep compton)" ]; then
  stderr "picom DBus interface unavailable"
  if [ -n "$(pgrep picom)" ]; then
    stderr "picom running without dbus interface"
    #killall picom & # Causes all windows to flicker away and come back ugly.
    #picom --dbus & # Causes all windows to flicker away and come back beautiful
  else
    stderr "picom not running"
  fi
  exit 1
fi

# === Setup sed ===

SED="${SED:-$(command -v gsed || printf 'sed')}"

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
opts=$(${picom_dbus}opts_get string:inactive_opacity | grep double | sed 's/^.*double\ //g') 

echo -e "$opts"
# Color invert the selected or focused window
  if [ $opts -eq 1 ]; then
    opa=0.5 # Set the window to have normal color
  else
    opa=1 # Set the window to have inverted color
  fi
  ${picom_dbus}opts_set string:inactive_opacity "double:${opa}" &
exit 0
