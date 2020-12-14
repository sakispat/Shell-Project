#!/bin/bash

# install php
sudo apt update
sudo apt install php php-cli php-fpm php-json php-common php-mysql php-zip php-gd php-mbstring php-curl php-xml php-pear php-bcmath

# php version
php --version

# install composer
echo "Install composer"
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
php -r "if (hash_file('sha384', 'composer-setup.php') === 'COMPOSER_KEY') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
php composer-setup.php
php -r "unlink('composer-setup.php');"

echo "Move composer"
mv composer.phar 'your_path/composer'

# install laravel
echo "Install laravel"
composer global require laravel/installer

# path
echo "Path"
nano 'your ~/.bashrc or ~/.bash_profile'
source 'your ~/.bashrc or ~/.bash_profile'
laravel

# new project
cd '/your_path/'
echo "New project laravel"
laravel new blog
cd '/your_path/blog'

# open editor
subl .  # or code .

# run server
php artisan serve
