#!/bin/sh

I=1
PULLED=0

for D in $(ls -d ~/repos/*); do
	cd $D
	echo -e -n "\033[2K \r [$I/$(ls -d ~/repos/* | wc -l)] $D"
	I=$(($I+1))
	(git pull 2>/dev/null | grep -q -v -i "already up to date") && (echo Pulled $D!; PULLED=$(($PULLED+1)))
done

echo -e "\n================================================================="
echo "Pulled $PULLED repos."
exit 0
