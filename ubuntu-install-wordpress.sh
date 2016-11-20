#!/bin/bash
echo -n "enter database name: "
read db_name
echo -n "enter url name: "
read url
echo -n "enter instance public dns: "
read pub_dns

sudo apt-get update \
 && sudo apt-get upgrade -y \
 && sudo apt-get -y autoremove

sudo apt-get install -y wordpress \
 && sudo apt-get install -y php \
 && sudo apt-get install -y mysql-server \
 && sudo apt-get install -y apache2

sudo ln -s /usr/share/wordpress /var/www/html/wordpress

sudo gzip -d /usr/share/doc/wordpress/examples/setup-mysql.gz \
 && sudo bash /usr/share/doc/wordpress/examples/setup-mysql -n $db_name $url

sudo echo "127.0.0.1 localhost $url" >> /etc/hosts

sudo /etc/init.d/apache2 restart

sudo chown -R www-data /usr/share/wordpress

sudo ln -s /etc/wordpress/config-localhost.php /etc/wordpress/config-$pub_dns.php
