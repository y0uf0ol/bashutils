#----- Basic install Script

echo "Enter your Mail Adress"
read -p "" Email

sudo apt update && sudo apt upgrade -y

sudo apt install fail2ban unattended-upgrades apt-listchanges -y

sudo dpkg-reconfigure -plow unattended-upgrades --default-priority

sudo sed -i 's/Unattended-Upgrade::Mail "";/Unattended-Upgrade::Mail "$Email";/g' /etc/apt/apt.conf.d/50unattended-upgrades

sudo sed -i 's/email_address=root/email_address=$Email/g' /etc/apt/listchanges.conf

echo "you can find the logs here /var/log/unattended-upgrades/unattended-upgrades.log"
echo " or you can configure a SMTP Server to get mails"


sudo ufw allow ssh

sudo ufw enable
