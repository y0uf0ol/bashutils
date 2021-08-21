#----- Basic install Script

sudo apt update && sudo apt upgrade -y

sudo apt install fail2ban

sudo apt install unattended-upgrades apt-listchanges bsd-mailx

sudo dpkg-reconfigure -plow unattended-upgrades
 

 #sudo vi /etc/apt/apt.conf.d/50unattended-upgrades


 #Unattended-Upgrade::Mail "xyz@abc.com";


 #Unattended-Upgrade::Automatic-Reboot "true";


 #email_address=xyz@abc.com

sudo unattended-upgrades --dry-run

sudo ufw allow ssh

sudo ufw enable
