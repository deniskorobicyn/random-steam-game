# Load DSL and set up stages
require 'capistrano/rails'
require 'capistrano/setup'
require 'capistrano/deploy'
require 'capistrano/bundler'

require 'capistrano/passenger'
require 'capistrano/sidekiq'
require 'capistrano/deploy-lock'

require "dotenv"
Dotenv.load

# Load custom tasks from `lib/capistrano/tasks` if you have any defined
Dir.glob("lib/capistrano/tasks/*.rake").each { |r| import r }
