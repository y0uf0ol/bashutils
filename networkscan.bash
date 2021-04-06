#!/bin/bash
#____________________IN DEVELOPMENT
#v1 of semi automation IP evaluation and Portscanning 16.05.2020

#____________________PLAN for Future  updates:
#automated ip range evaluation and scanning 
#implementation of nessus and openvas
#send report via mail
#script scaning 10% done 
#metsploit framework integration
#searchsploit integration

echo "Enter your scan parameter, for help press h"
read -p ""  ScanV


if [ "$ScanV" == "h" -o "$ScanV" == "H" ] 
	then
	echo " For FULL Scan type 'F' for a QUICK Scan type 'Q'"
	echo " Sample Syntax ./networkscan.bash Q 192.168.0.1"
	echo " this script also converts the XML into HTML"

	else
		echo "Typ in your IP or Network"
		read -p "" IP
       	
		if [ "$ScanV" == "f" -o "$ScanV" == "F" ];
		then

			nmap -p- -v --script=vulners.nse -oX Report-$IP.xml $IP 
			
			echo -e "\e[1;31mDONE YOU CAN FIND YOUR XML HERE:\e[0m"
			ls -la | grep Report

			#HTML Convert
			xsltproc Report-$IP.xml -o Report-$IP.html

			echo -e "\e[1;31mYour HTML Report is created\e[0m"
			firefox Report-$IP.html &


		elif [ "$ScanV" == "q" -o "$ScanV" == "Q" ];
			then 	
				nmap -F -sV -v --open --script=vulners.nse -oX Report-$IP.xml $IP	

				echo -e "\e[1;31mDONE YOU CAN FIND YOUR XML HERE:\e[0m"
				ls -la | grep Report

				#HTML Convert
				xsltproc Report-$IP.xml -o Report-$IP.html

				echo -e "\e[1;31mYour HTML Report is created\e[0m"
				firefox Report-$IP.html 	
		fi
fi




