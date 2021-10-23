#----- Basic install Script

echo "Enter your Mail Adress"
read -p "" Email
echo "Enter your NTP-Pool/Default is German x.de.pool.ntp.org"
read -p "" Pool

sudo apt update && sudo apt upgrade -y

sudo apt install fail2ban unattended-upgrades apt-listchanges ufw ntp -y

sudo dpkg-reconfigure -plow unattended-upgrades --default-priority

sudo sed -i 's/Unattended-Upgrade::Mail "";/Unattended-Upgrade::Mail "$Email";/g' /etc/apt/apt.conf.d/50unattended-upgrades

sudo sed -i 's/email_address=root/email_address=$Email/g' /etc/apt/listchanges.conf


if [ -z "$Pool"]
    then
        sudo sed -i 's/pool 0.ubuntu.pool.ntp.org iburst/0.de.pool.ntp.org/g' /etc/ntp.conf
        sudo sed -i 's/pool 1.ubuntu.pool.ntp.org iburst/1.de.pool.ntp.org/g' /etc/ntp.conf
        sudo sed -i 's/pool 2.ubuntu.pool.ntp.org iburst/2.de.pool.ntp.org/g' /etc/ntp.conf
        sudo sed -i 's/pool 3.ubuntu.pool.ntp.org iburst/3.de.pool.ntp.org/g' /etc/ntp.conf
    else
        sudo sed -i 's/pool 0.ubuntu.pool.ntp.org iburst/0.$Pool/g' /etc/ntp.conf
        sudo sed -i 's/pool 1.ubuntu.pool.ntp.org iburst/1.$Pool/g' /etc/ntp.conf
        sudo sed -i 's/pool 2.ubuntu.pool.ntp.org iburst/2.$Pool/g' /etc/ntp.conf
        sudo sed -i 's/pool 3.ubuntu.pool.ntp.org iburst/3.$Pool/g' /etc/ntp.conf
fi


sudo ntp service restart

echo -e "\e[1;31myou can find the logs here /var/log/unattended-upgrades/unattended-upgrades.log\e[0m"
echo -e "\e[1;31mor you can configure a SMTP Server to get mails\e[0m"


sudo ufw allow ssh

sudo ufw enable
