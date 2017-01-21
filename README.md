# Random Steam Game

https://api.travis-ci.org/deniskorobicyn/random-steam-game.svg?branch=master

Welcome to Random Steam Game source. View it on heroku: http://random-steam-game.herokuapp.com/

## Development & Contributing

### Docker

1. install Docker
2. docker-compose build
3. docker compose run --rm rails bundle install
4. docker compose run --rm rails bundle exec rake db:migrate
5. docker compose run --rm rails

### Vagrant
1. Go to [vagrant](https://www.vagrantup.com/downloads.html) and install it
2. `vagrant plugin install vagrant-dns`
3. `vagrant up`
4. `vagrant ssh`
5. `cd code`
6. `rails s`
7. Navigate you browser to [random-steam-game.ruby.dev](random-steam-game.ruby.dev)
