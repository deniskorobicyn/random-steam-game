source 'https://rubygems.org'

# -- Framework
gem 'rails', '= 5.0.2'

# -- Serialization
gem 'active_model_serializers', '~> 0.10.0'

# -- Authentificcation
gem 'devise', '~> 4.2.0'
gem 'omniauth-steam', '~> 1.0.3'

# -- Environment
gem 'figaro', '~> 1.1.1'

# -- Database
gem 'kaminari', '~> 1.0.1'
gem 'pg', '~> 0.19'
gem 'redis', '~> 3.2'

# -- Frontend
gem 'bootstrap-sass' , '~> 3.3.7'
gem 'browserify-rails'
gem 'jquery-rails', '~> 4.2.1'
gem 'react-rails', '~> 1.10.0'
gem 'sass-rails', '~> 5.0.6'
gem 'slim-rails', '~> 3.1.1'
gem 'uglifier', '~> 3.0.3'

# -- Buisness Logic
gem "interactor-rails", "~> 2.0.2"
gem 'steam-api', '~> 1.1.0'

# -- background
gem 'sidekiq', '5.0.0.beta1'
gem 'sidekiq-status', '0.6.0 '

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
  gem 'rspec-rails', '~> 3.5.2'
  gem 'shoulda-matchers', '~> 3.1'
end

group :development do
  gem 'pry-rails'
  gem 'spring'
  gem 'web-console', '~> 3.4'
end
