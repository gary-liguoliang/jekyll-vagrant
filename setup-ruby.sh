#!/bin/bash
#https://gorails.com/setup/ubuntu/14.04#ruby
sudo apt-get -y install libgdbm-dev libncurses5-dev automake libtool bison libffi-dev

gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3

\curl -sSL https://get.rvm.io | bash -s stable

source /etc/profile.d/rvm.sh
source /home/vagrant/.profile 
rvm install  2.3.1 

rvm use  2.3.1 --default

ruby -v
