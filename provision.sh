#bin/bash
sudo apt-get update -y && apt-get upgrade -y
sudo apt-get install -y apache2
apt-get install -y php5 libapache2-mod-php5 php5-mcrypt php5-cli
sudo cp /vagrant/index.php /var/www/html/index.php
sudo service apache2 restart
export DEBIAN_FRONTEND=noninteractive
debconf-set-selections <<< 'mariadb-server-10.0 mysql-server/root_password password root'
debconf-set-selections <<< 'mariadb-server-10.0 mysql-server/root_password_again password root'
apt-get install -y mariadb-server
sudo cp /vagrant/my.cnf /etc/mysql/my.cnf
sudo service mysql restart







