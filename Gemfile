source 'https://rubygems.org'
ruby '2.2.0'

gem 'rails', '4.2.5'
gem 'sass-rails', '~> 5.0'
gem 'pg'
gem 'devise'
gem 'omniauth-facebook'
gem 'jwt', '~> 0.1.13'
gem 'jquery-rails'
gem 'turbolinks'

# For testing
group :development, :test do
  gem 'rspec-rails'
  gem 'faker'
  gem 'database_cleaner'
  gem 'shoulda-matchers'
  gem 'guard-rspec', require: false
end

gem 'simplecov', require: false, group: :test

group :test do
  gem 'capybara'
  gem 'launchy'
  gem 'factory_girl_rails'
end

# Heroku deployment
group :production, :staging do
  gem 'rails_12factor'
end

gem 'dotenv-rails', :groups => [:development, :test]

# Youtube videos and Google api
gem 'google-api-client', '~> 0.4.3', :require => 'google/api_client'
gem 'trollop'

gem 'newrelic_rpm'

group :development do
  gem 'pry'
  gem 'rack-mini-profiler'
  gem 'pry-nav'
  gem 'pry-rails'
  gem 'pry-stack_explorer'
  # Add model attributes
  gem 'annotate'
  gem 'chronic'
  # Turn off verbose logging of asset requests
  gem 'quiet_assets'
  # better error console
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'meta_request'
  gem 'bullet'
end
