set :application, 'random-steam-game'
set :repo_url, 'git@github.com:deniskorobicyn/random-steam-game.git'

set :use_sudo, false
set :scm, :git
set :format, :pretty
set :pty, false
set :deploy_via, :remote_cache
set :keep_releases, 5
set :linked_files, %w(config/database.yml .env)

set :sidekiq_default_hooks, true
