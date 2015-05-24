#!/bin/bash

#yum update
echo "Updateing yum command..."
sudo yum -y update

#Install PHP and Apache
echo "Installing PHP..."
sudo yum -y install php

#Start Apache Web Server
echo "Starting Apache Web Server..."
sudo systemctl start httpd
sudo systemctl enable httpd.service

#Disable firewall
echo "Disabling firewall..."
sudo systemctl stop firewalld
sudo systemctl disable firewalld

#Disable iptables
echo "Disabling iptables..."
sudo yum install iptables-services
sudo systemctl stop iptables
sudo systemctl disable iptables.services

# Symbolic Link
echo "Setting Symbolic Link..."
rm -rf /var/www/html
ln -fs /vagrant /var/www/html

# Install MariaDB
echo "Installing MariaDB..."
sudo yum -y install mariadb mariadb-server
sudo systemctl enable mariadb.service

