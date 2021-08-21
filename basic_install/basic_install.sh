#----- Basic install Script

sudo apt update && sudo apt upgrade -y


sudo apt install fail2ban unattended-upgrades apt-listchanges -y

sudo dpkg-reconfigure -plow unattended-upgrades --default-priority
 

 #sudo vi /etc/apt/apt.conf.d/50unattended-upgrades


 #Unattended-Upgrade::Mail "xyz@abc.com";


 #Unattended-Upgrade::Automatic-Reboot "true";


 #email_address=xyz@abc.com
 

sudo ufw allow ssh

sudo ufw enable
