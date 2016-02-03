source 'https://rubygems.org'

ruby '2.3.0'

##### Standard Gems #####

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.5'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use slim for templating
gem 'slim-rails', '3.0.1'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
#use bootstrap for front end framework
gem 'bootstrap-sass', '~> 3.3', '>= 3.3.5.1'
# Use jquery as the JavaScript library
gem 'jquery-rails'
gem 'jquery-ui-rails', '~> 5.0', '>= 5.0.5'
gem 'jquery-turbolinks'

gem 'will_paginate'
# Use puma as dev server
gem 'puma'
# Use devise for authentication
gem 'devise', '~> 3.5', '>= 3.5.2'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'

##### Project based gems #####

gem 'select2-rails', '~>4.0.1'
# omniauth for github
gem 'omniauth'
gem 'omniauth-github', '~> 1.1', '>= 1.1.2'
gem 'octokit', '~> 4.0'
gem 'dotenv-rails'
gem 'paranoia', '~> 2.1', '>= 2.1.5'
gem 'exception_notification'
gem 'slack-notifier'
gem 'twitter-text', '~> 1.13'
gem 'paperclip', '~> 4.3'


##### Gem for testing/development and production #####

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'
  gem 'rspec-rails', '~> 3.4'
  gem 'shoulda-matchers', '~> 3.0', '>= 3.0.1'
  gem 'factory_girl_rails', '~> 4.5.0'
  gem 'guard-rspec', '~> 4.6', '>= 4.6.4'
  gem 'ffaker', '2.1.0'
  # Use sqlite3 as the database for Active Record
  gem 'sqlite3'
end

group :development do
  gem 'quiet_assets', '~> 1.1'
  gem 'awesome_print', '~> 1.6', '>= 1.6.1'
  gem 'better_errors', '~> 2.1', '>= 2.1.1'
  gem 'meta_request', '~> 0.3.4'
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'
  gem 'spring'
end

group :test do
  gem 'database_cleaner', '~> 1.5', '>= 1.5.1'
  gem 'selenium-webdriver', '~> 2.48', '>= 2.48.1'
  gem 'capybara', '~> 2.5'
end

#heroku deployment
group :production do
  gem 'pg', '0.18.4'
  gem 'rails_12factor'
end
