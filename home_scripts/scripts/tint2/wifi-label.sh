#!/bin/sh

echo /usr/share/t2ec/network.svg
iw dev | grep ssid | awk '{print $2}'
