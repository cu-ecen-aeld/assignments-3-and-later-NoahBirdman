#!/bin/sh
# Writer app for assignment 1
# Author: Noah Bergman


WRITEFILE=""
WRITESTR=""

if [ $# -lt 2 ]
then
	echo "Not enough arguments"
	exit 1
else
	WRITEFILE=$1
	WRITESTR=$2
fi

#Make dir if not exist
if [ ! -d "$WRITEFILE" ]
then
	echo "Creating Dir"
	mkdir -p "$(dirname "$WRITEFILE")"
fi

#Write to file
echo "${WRITESTR}" > "${WRITEFILE}"

if [ -f "$WRITEFILE" ]
then
	exit 0
else
	echo "$WRITEFILE could not be created"
	exit 1
fi
