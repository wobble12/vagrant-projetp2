#!/bin/sh

# Ajout des dépôts requis
echo "Ajout des dépôts requis"
apt-get update
apt-get install -y apache2 ca-certificates apt-transport-https curl
wget -q https://packages.sury.org/php/apt.gpg -O- | sudo apt-key add -
echo "deb https://packages.sury.org/php/ stretch main" | sudo tee /etc/apt/sources.list.d/php.list
curl -sL https://deb.nodesource.com/setup_8.x | sudo bash -
# Installation des paquets requis
echo "Ajout des paquets requis"
sudo apt-get update
sudo apt-get -y  install php7.2 php7.2-xml php-xml php7.2-zip php7.2-dev php-pear git composer mongodb nodejs acl
pecl channel-update pecl.php.net
pecl install mongodb
apt-get remove -y php7.3* php-pear
# Configuration des logiciels
echo "Configuration des logiciels"
echo "extension=mongodb.so" | sudo tee -a /etc/php/7.2/cli/php.ini
su -c 'git config --global credential.helper "cache --timeout=25200"' vagrant
adduser vagrant www-data
systemctl enable mongodb
a2enmod rewrite
systemctl restart apache2
echo "POUR COMMENCER À TRAVAILLER, CONNECTEZ VOUS AVEC \"vagrant ssh\""
echo 'PUIS CLONEZ LE PROJET AVEC \"sudo git clone https://github.com/IUT-LAVAL-MMI/1819-LPDIWA-P2-G1.git lpdiwa-p2-g1 && cd lpdiwa-p2-g1\"'
echo "Enfin, lancez \"sudo ./install.sh\""