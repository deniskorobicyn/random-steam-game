source 'https://rubygems.org'

# -- Framework
gem 'rails', '= 5.0.0.1'

# -- Serialization
gem 'active_model_serializers', '~> 0.10.0'

# -- Authentificcation
gem 'devise', '~> 4.2.0'
gem 'omniauth-steam', '~> 1.0.3'

# -- Environment
gem 'figaro', '~> 1.1.1'

# -- Database
gem 'pg', '~> 0.19'

# -- Frontend
gem 'slim-rails', '~> 3.1.1'
gem 'sass-rails', '~> 5.0.6'
gem 'uglifier', '~> 3.0.3'
gem 'coffee-rails', '~> 4.2.1'
gem 'jquery-rails', '~> 4.2.1'
gem 'bootstrap-sass' , '~> 3.3.7'

# -- Buisness Logic
gem 'steam-api', '~> 1.1.0'
gem "interactor-rails", "~> 2.0.2"

# -- Server
group :production do
  gem 'rails_12factor'
  gem 'unicorn'
end

group :development, :test do
  gem 'byebug'
  gem 'factory_girl_rails'
  gem 'rspec-rails', '~> 3.5.2'
end

group :development do
  gem 'web-console', '~> 2.0'
  gem 'pry-rails'
  gem 'spring'
end

ruby "2.3.1"

