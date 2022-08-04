#!/bin/sh

while :; do
        bspc node focused.floating --layer above
        bspc node focused.floating --layer normal
        bspc subscribe --count 1 node_focus > /dev/null || break
done
