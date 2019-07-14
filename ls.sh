#!/bin/sh

DIR=$1
if [ -z $DIR ] ; then
	DIR="."
fi

echo "Directory listing for $DIR:"

for FILE in $DIR/* $DIR/.* ; do
	# Skip FILE if it does not exist (e.g. if the expansion failed
	# and gave us a literal './*')
	[ ! -e "$FILE" ] && continue

	IS_BLOCK=""; [ -b "$FILE" ] && IS_BLOCK=b
	IS_CHAR=""; [ -c "$FILE" ] && IS_CHAR=c
	IS_DIR=""; [ -d "$FILE" ] && IS_DIR=d
	IS_FILE=""; [ -f "$FILE" ] && IS_FILE=f
	IS_SGID=""; [ -g "$FILE" ] && IS_SGID="sgid "
	IS_GID=""; [ -G "$FILE" ] && IS_GID="GID=ours "
	IS_STICKY=""; [ -k "$FILE" ] && IS_STICKY=t
	IS_LINK=""; [ -L "$FILE" ] && IS_LINK=l
	IS_UID=""; [ -O "$FILE" ] && IS_UID="UID ours "
	IS_PIPE=""; [ -p "$FILE" ] && IS_PIPE=p
	IS_SUID=""; [ -u "$FILE" ] && IS_SUID="suid "
	IS_SOCK=""; [ -S "$FILE" ] && IS_SOCK="socket "
	IS_SIZE=""; [ -s "$FILE" ] && IS_SIZE="  size > 0 "
	CAN_READ="-"; [ -r "$FILE" ] && CAN_READ=r
	CAN_WRITE="-"; [ -w "$FILE" ] && CAN_WRITE=w
	CAN_EXEC="-"; [ -x "$FILE" ] && CAN_EXEC=x
	echo "$FILE: ${IS_DIR}${IS_CHAR}${IS_BLOCK}${IS_PIPE}${IS_LINK}${IS_STICKY}\
${IS_PIPE}${IS_SOCK} ${IS_UID}${IS_GID}${IS_SUID}${IS_SGID}\
${CAN_READ}${CAN_WRITE}${CAN_EXEC}${IS_SIZE}"
done
