#!/bin/bash
echo "Welcome to Chips File Search Program"
echo "Local or SSH Scan ?"
echo "Press 1 for Local & 2 for SSH Scan";
read answer
if [ $answer = "1" ]; then
	sh search.sh
elif [ $answer = "2" ]; then
	sh main.sh
fi
