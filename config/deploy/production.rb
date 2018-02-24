# Choose one of servers or deploy simultaneously
# web and cron roles should be assigned to only one server

server 'random-steam-game.com', user: 'web', roles: %w(app db web)

set :log_level, :debug

ask :branch, :master
set :branch, fetch(:branch)
set :deploy_to, "/home/web/#{fetch(:application)}"
set :stage, :production

set :bundle_path, false
set :bundle_flags, '--quiet'

set :passenger_restart_command, "passenger-config restart-app"
