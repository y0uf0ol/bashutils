#! /bin/bash
 
#Set Variables
USERNAME="YOURDOMAIN"
PW="PASSWORD" 
HOSTNAME="HOSTENAME"

#Logfile
 echo -e "\n" >>dyndns.log
 echo -e "UPDATE STARDED :" >> dyndns.log
 date >> dyndns.log
 
#UPDATE DDNS
curl --silent --show-error --insecure --user $USERNAME:$PW https://dyndns.strato.com/nic/update?hostname=$HOSTNAME >> dyndns.log
