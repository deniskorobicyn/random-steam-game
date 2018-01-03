# Random Steam Game

![](https://api.travis-ci.org/deniskorobicyn/random-steam-game.svg?branch=master)
[![Maintainability](https://api.codeclimate.com/v1/badges/4afe18cb77a782fe4455/maintainability)](https://codeclimate.com/github/deniskorobicyn/random-steam-game/maintainability)
[![Test Coverage](https://api.codeclimate.com/v1/badges/4afe18cb77a782fe4455/test_coverage)](https://codeclimate.com/github/deniskorobicyn/random-steam-game/test_coverage)

Welcome to Random Steam Game source. View it on heroku: http://random-steam-game.herokuapp.com/

## Development

### Docker

1. install [Docker](https://www.docker.com/)
2. docker-compose build
3. cp config/database.yml.docker config/database.yml
4. docker compose run --rm rails bundle install
5. docker compose run --rm rails bundle exec rake db:migrate
6. docker compose run --rm rails

### Vagrant
1. Go to [vagrant](https://www.vagrantup.com/downloads.html) and install it
2. `vagrant plugin install vagrant-dns`
3. `vagrant up`
4. `vagrant ssh`
5. `cd code`
6. `rails s`
7. Navigate you browser to [random-steam-game.ruby.dev](random-steam-game.ruby.dev)
