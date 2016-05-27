#!/bin/bash
#		Copyright 2016 Pratik Kubal
#
#   Licensed under the Apache License, Version 2.0 (the "License");
#   you may not use this file except in compliance with the License.
#   You may obtain a copy of the License at
#
#       http://www.apache.org/licenses/LICENSE-2.0
#
#   Unless required by applicable law or agreed to in writing, software
#   distributed under the License is distributed on an "AS IS" BASIS,
#   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#   See the License for the specific language governing permissions and
#   limitations under the License.
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
