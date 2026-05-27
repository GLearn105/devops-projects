#!/bin/bash

NILAI=75

if [ $NILAI -ge 90 ]; then
	echo "Grade A"
elif [ $NILAI -ge 75 ]; then
	echo "Grade B"
else 
	echo "Grade C"
fi

FILE="/home/glearn/notes.txt"
if [ -f "$FILE" ]; then
	echo "file ada!"
else
	echo "file tidak ditemukan!"
fi
