#!/bin/bash
clear
echo "---SSH Search Module---"
echo ""
echo "Enter the number of hosts"
read num
COUNTER=0
while [  $COUNTER -lt $num ]; do
             	echo "Enter the Hosts"
		read host
		HOSTS="${host}"
		#ping Test
		echo "Pinging to check if host is online"
		echo "."
		echo "."
		echo "."
		COUNT=4
		for myHost in ${HOSTS}
		do
			count=$(ping -c $COUNT $myHost | grep 'received' | awk -F',' '{ print $2 }' | awk '{ print $1 }')
			if [ $count -eq 0 ]; then
				# 100% failed 
				echo "Host : $myHost is down (ping failed) at $(date)"
				echo "Please enter Valid Hosts & restart the program"
			fi
		done
		echo
		echo "Host is Available"
		echo
		#ssh connection
		SCRIPT="./chips/search.sh;"
		for HOSTNAME in ${HOSTS} ; do
			echo "Enter the Username"
			read USERNAME
			ssh -l ${USERNAME} ${HOSTNAME} "${SCRIPT}"
		done
	        let COUNTER=COUNTER+"1" 
done
echo
echo "---Program finished---"
echo
