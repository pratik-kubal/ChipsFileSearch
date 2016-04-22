#!/bin/bash
echo "---Local Search Module---"
echo
echo -n "Enter the file to be searched:"
read FILE
echo
echo "Finding"
find /home -name "$FILE">search.log
LOG="search.log" 
if [ -s ${LOG} ] ; then
	echo " "
	echo
	echo
	ip="$(ifconfig | grep -A 1 'eth0' | tail -1 | cut -d ':' -f 2 | cut -d ' ' -f 1)"
	echo "$FILE Found in ${ip}"
else
	echo " "
	echo
	echo
	echo "$FILE Not Found"
fi
