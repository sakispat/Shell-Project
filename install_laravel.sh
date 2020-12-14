#!/bin/bash

# install php
sudo apt update
sudo apt install php php-cli php-fpm php-json php-common php-mysql php-zip php-gd php-mbstring php-curl php-xml php-pear php-bcmath

# php version
php --version

# install composer
echo "Install composer"
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
php -r "if (hash_file('sha384', 'composer-setup.php') === '756890a4488ce9024fc62c56153228907f1545c228516cbf63f885e036d37e9a59d27d63f46af1d4d07ee0f76181c7d3') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
php composer-setup.php
php -r "unlink('composer-setup.php');"

echo "Move composer"
mv composer.phar /usr/local/bin/composer

# install laravel
echo "Install laravel"
composer global require laravel/installer

# path
echo "Path"
nano ~/.bashrc
source ~/.bashrc
laravel

# new project
cd /opt/lampp/htdocs/developers/
echo "New project laravel"
laravel new blog
cd /opt/lampp/htdocs/developers/blog

# open editor
subl .

# run server
php artisan serve