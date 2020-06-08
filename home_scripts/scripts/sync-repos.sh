#!/bin/sh

for D in $(ls -d ~/repos/*); do
	cd $D
	echo Performing git pull on $D
	git pull
	echo Done syncing $D!
done
