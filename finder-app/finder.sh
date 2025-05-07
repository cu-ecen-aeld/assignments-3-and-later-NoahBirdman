#!/bin/sh
#Finder shell script for assignment 1
#Author: Noah Bergman

FILESDIR=""
SEARCHSTR=""
NUMFILES=0
NUMLINES=0

if [ $# -lt 2 ]
then
	echo "Missing Input Args"
	exit 1
else
	FILESDIR=$1
	SEARCHSTR=$2
fi

if [ ! -d "$FILESDIR" ]
then 
	echo "Dir doesn't exist"
	exit 1
fi

NUMFILES=$(find "$FILESDIR" -type f -name '*' -printf x | wc -c)
NUMLINES=$(grep -rw "$FILESDIR" -e "$SEARCHSTR" | wc -l) 
echo "The number of files are $NUMFILES and the number of matching lines are $NUMLINES"

exit 0
