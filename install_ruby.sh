#!/bin/bash

# install curl, nodejs and yarn
sudo apt install curl
curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list

sudo apt-get update
sudo apt-get install git-core zlib1g-dev build-essential &&
	libssl-dev libreadline-dev libyaml-dev libsqlite3-dev &&
	sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev &&  
	software-properties-common libffi-dev nodejs yarn

# install rbenv
cd '/your_path/'
git clone https://github.com/rbenv/rbenv.git ~/.rbenv
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(rbenv init -)"' >> ~/.bashrc
exec $SHELL

git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
echo 'export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"' >> ~/.bashrc
exec $SHELL

rbenv install 2.7.2
rbenv global 2.7.2
ruby -v

# install rvm
sudo apt-get install libgdbm-dev libncurses5-dev automake libtool bison libffi-dev
gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
curl -sSL https://get.rvm.io | bash -s stable
source ~/.rvm/scripts/rvm
rvm install 2.7.2
rvm use 2.7.2 --default
ruby -v

# ruby
cd '/your_path/'
wget http://ftp.ruby-lang.org/pub/ruby/2.7/ruby-2.7.2.tar.gz
tar -xzvf ruby-2.7.2.tar.gz
cd ruby-2.7.2/
./configure
make
sudo make install
ruby -v

# install rails
gem install rails
rbenv rehash

# rails version
rails --version