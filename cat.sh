#!/bin/sh

FILE=$1
if [ -z $FILE ] ; then
	echo "File must be specified"
	exit 1
fi

while read LINE; do
	echo "$LINE"
done < "$FILE"
