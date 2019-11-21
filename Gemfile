source 'https://rubygems.org'

# -- Framework
gem 'rails', '5.2.2.1'

# -- Serialization
gem 'active_model_serializers', '~> 0.10.7'

# -- Authentificcation
gem 'devise', '~> 4.7.1'
gem 'omniauth-rails_csrf_protection', '~> 0.1'
gem 'omniauth-steam', '~> 1.0.6'

# -- Environment
gem 'dotenv-rails', '~> 2.4.0'

# -- Database
gem 'kaminari', '~> 1.1.1'
gem 'pg', '~> 1.1'
gem 'redis', '~> 3.3'

# -- Frontend
gem 'bootstrap-sass' , '~> 3.4.0'
gem 'jquery-rails', '~> 4.3.4'
gem 'sass-rails', '~> 5.0.6'
gem 'slim-rails', '~> 3.1.1'
gem 'uglifier', '~> 4.2.0'

# -- Buisness Logic
gem "interactor-rails", "~> 2.2.0"
gem 'steam-api', '~> 1.1.0'

# -- background
gem 'sidekiq', '5.0.0.beta1'
gem 'sidekiq-status', '0.6.0 '

# -- Server
group :production do
  gem 'rails_12factor'
  gem 'unicorn'
end

group :development, :test do
  gem 'byebug'
  gem 'factory_girl_rails'
  gem 'rspec-rails', '~> 3.9.0'
  gem 'shoulda-matchers', '~> 3.1'
  gem 'rails-controller-testing'
  gem 'simplecov'
end

group :development do
  gem 'pry-rails'
  gem 'web-console', '~> 3.4'
  gem 'awesome_print'
  gem "capistrano", "~> 3.11", require: false
end
