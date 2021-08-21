#----- Basic install Script

echo "Enter your Mail Adress"
read -p "" Email

sudo apt update && sudo apt upgrade -y

sudo apt install fail2ban unattended-upgrades apt-listchanges -y

sudo dpkg-reconfigure -plow unattended-upgrades --default-priority

sudo sed -i 's/Unattended-Upgrade::Mail "";/Unattended-Upgrade::Mail "$Email";/g' /etc/apt/apt.conf.d/50unattended-upgrades

sudo sed -i 's/email_address=root/email_address=$Email/g' /etc/apt/listchanges.conf




sudo ufw allow ssh

sudo ufw enable
