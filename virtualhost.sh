#!/bin/bash
sudo service apache2 restart
read -p 'site adresi: ' hostname
sudo mkdir -p -- /var/www/$hostname/public_html
sudo chmod 0777 -R /var/www/$hostname/
sudo touch /etc/apache2/sites-available/$hostname.conf 
sudo chmod 0777 /etc/apache2/sites-available/$hostname.conf 
sudo echo "<VirtualHost *:80>" > /etc/apache2/sites-available/$hostname.conf 
sudo echo "DocumentRoot \"/var/www/$hostname/public_html\"" >> /etc/apache2/sites-available/$hostname.conf 
sudo echo "ServerName $hostname" >> /etc/apache2/sites-available/$hostname.conf 
sudo echo "ServerAlias www.$hostname" >> /etc/apache2/sites-available/$hostname.conf 
sudo echo "</VirtualHost>" >> /etc/apache2/sites-available/$hostname.conf 
sudo chmod 0644 /etc/apache2/sites-available/$hostname.conf 
sudo chmod 0777 /etc/hosts
sudo echo "127.0.0.1  $hostname" >> /etc/hosts
sudo chmod 0644 /etc/hosts
sudo a2ensite $hostname
sudo service apache2 reload
sudo service apache2 restart
echo http://$hostname eklendi
