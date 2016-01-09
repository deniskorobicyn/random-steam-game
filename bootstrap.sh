#!/bin/bash

set -e

echo "deb http://apt.postgresql.org/pub/repos/apt/ $(lsb_release -cs)-pgdg main" | sudo tee /etc/apt/sources.list.d/pgdg.list
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
sudo apt-get -y -q update &> /dev/null
sudo apt-get -y -q upgrade &> /dev/null

sudo apt-get install -y \
  postgresql-9.4 postgresql-server-dev-9.4 \
  postgresql-contrib libxml2 \
  curl nginx nodejs \
  libgmp3-dev git

sudo -u postgres psql -c "CREATE USER vagrant WITH PASSWORD 'vagrant' SUPERUSER;"
sudo -u postgres createdb -O vagrant random_steam_game_dev
sudo -u postgres createdb -O vagrant random_steam_game_test

gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
curl -sSL https://get.rvm.io | bash -s stable

source ~/.rvm/scripts/rvm
rvm install 2.3.0
cd ~/code

sudo cp ./nginx_default /etc/nginx/sites-enabled/default
sudo service nginx restart

cp config/database.yml.sample config/database.yml

echo "2.3.0" > .ruby-version
gem install bundler
bundle install
rake db:migrate
rake db:test:prepare

