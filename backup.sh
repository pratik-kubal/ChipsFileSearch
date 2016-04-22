#!/bin/bash
echo "Enter the Username:"
read USERNAME
USERNAME="computer"
echo "Enter Three hosts:"
read host1
read host2
read host3
HOSTS="${host1} ${host2} ${host3}"
#ping Test
echo "Pinging to check all hosts are up"
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
echo "All Hosts are available"
#ssh connection
SCRIPT="./chips/search.sh;"
for HOSTNAME in ${HOSTS} ; do
ssh -l ${USERNAME} ${HOSTNAME} "${SCRIPT}"
done
