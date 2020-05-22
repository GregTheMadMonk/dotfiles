#!/bin/sh
FILES=$(find $1/*)

for F in $FILES
do
	echo $F
	sed 's/        /\t\t\t\t/g' $F -i
	sed 's/      /\t\t\t/g' $F -i
	sed 's/    /\t\t/g' $F -i
	sed 's/  /\t/g' $F -i
done
