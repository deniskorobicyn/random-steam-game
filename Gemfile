source 'https://rubygems.org'

# -- Framework
gem 'rails', '4.2.5'

# -- Authentificcation
gem 'devise'
gem 'omniauth-steam'

# -- Environment
gem 'figaro'

# -- Database
gem 'pg', '~> 0.15'

# -- Frontend
gem 'slim-rails'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.1.0'
gem 'jquery-rails'
gem 'bootstrap-sass' 

# -- Buisness Logic
gem 'steam-api'
gem "interactor-rails", "~> 2.0"

# -- Server
group :production do
  gem 'rails_12factor'
  gem 'unicorn'
end

group :development, :test do
  gem 'byebug'
  gem 'factory_girl_rails'
  gem 'rspec-rails'
  gem 'quiet_assets'
end

group :development do
  gem 'web-console', '~> 2.0'
  gem 'pry'
  gem 'spring'
end

ruby "2.3.0"

