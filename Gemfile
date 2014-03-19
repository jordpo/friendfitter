source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.0.2'

# Use postgresql as the database for Active Record
gem 'pg'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.0'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.2'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

# Devise for user authentication
gem 'devise'

# Omniauth gems
gem 'omniauth-facebook'

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

ruby '2.0.0'
