#!/bin/bash 
# name : 
#	nodeup.bash
# author:
#	Munair (based on code from Stanford's Startup Engineering course on Coursera
# purpose:
#	Configuring node.js Ubuntu 12.04 LTS EC2 Instance with a GitHub repository
#	based at https://github.com/munair.
# arguments:
#	- $1 : Repository on GitHub
#
#

# Install nvm: node-version manager
# https://github.com/creationix/nvm
sudo apt-get install -y git
sudo apt-get install -y curl
curl https://raw.github.com/creationix/nvm/master/install.sh | sh

# Update apt-get’s knowledge of which packages are where
sudo apt-get update
# Install a special package
sudo apt-get install -y python-software-properties python g++ make 
# Add a new repository for apt-get to search
sudo add-apt-repository -y ppa:chris-lea/node.js
# Update apt-get’s knowledge of which packages are where
sudo apt-get update
# Now install nodejs and npm
sudo apt-get install -y nodejs

# Load nvm and install latest production node
source $HOME/.nvm/nvm.sh
nvm install v0.10.12
nvm use v0.10.12

# Install rlwrap to provide libreadline features with node
# See: http://nodejs.org/api/repl.html#repl_repl
sudo apt-get install -y rlwrap

# Install Heroku toolbelt
# https://toolbelt.heroku.com/debian
wget -qO- https://toolbelt.heroku.com/install-ubuntu.sh | sh

# git pull and install dotfiles as well
cd $HOME
if [ -d ./dotfiles/ ]; then
    mv dotfiles dotfiles.old
fi
git clone https://github.com/munair/dotfiles.git
ln -sb dotfiles/.screenrc .
ln -sb dotfiles/.bash_profile .
ln -sb dotfiles/.vimrc .
ln -sb dotfiles/.bashrc .
ln -sb dotfiles/.bashrc_custom .

# Next, create an SSH key and (by copy/pasting with the mouse)
# add it to Github at https://github.com/settings/ssh
ssh-keygen -t rsa -N '' -f ~/.ssh/id_rsa
cat ~/.ssh/id_rsa.pub

# Now you can clone via SSH from github.
# Cloning over SSH allows you to push/pull changes.
# Use the credential helper with caching set to 1 hour to avoid
# having to repeatedly enter your username and password.
git clone https://github.com/munair/$1.git
git config --global user.name "Munair Simpson"
git config --global user.email "munair@gmail.com"
git config --global credential.helper "cache --timeout=3600"

# Next change into the app directory and get all
# npm dependencies.
cd $1
npm install express
npm install postmark
npm install swig --save

