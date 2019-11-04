#!/bin/sh

FIFONAME=brightness.fifo

rm /tmp/$FIFONAME
mkfifo /tmp/$FIFONAME
chmod 777 /tmp/$FIFONAME
while [ true ]; do
	tail -f /tmp/$FIFONAME | /home/greg/scripts/set-brightness.sh
done
