source 'http://rubygems.org'
ruby "2.1.0"

gem 'rails', '4.1.1'

gem 'pg'
gem 'pg_search', :git => 'git://github.com/Casecommons/pg_search.git'

gem 'devise'

gem 'omniauth'
gem 'omniauth-twitter'
gem 'omniauth-facebook'
gem 'omniauth-google-oauth2'
gem 'heroku'
gem 'slim'
gem 'bluecloth'
gem 'paper_trail'
gem 'state_machine'
gem 'cancan'
gem 'taps'
gem 'will_paginate'

gem 'bootstrap-sass', '~> 3.1.1'
gem 'coffee-rails'
gem 'jquery-rails'
gem "jquery_mobile-rails"
# Gems used only for assets and not required
# in production environments by default.

group :production do
  gem 'rails_12factor'
end

group :assets do
  gem 'sass-rails', '>= 3.2'
  gem 'uglifier', '>= 1.0.3'
end

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# Use unicorn as the web server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

gem 'twitter'

group :development do
  gem 'quiet_assets'
  gem 'localtunnel'
  gem 'sqlite3'
  gem 'rb-readline'
end

group :development, :test do
  gem 'pry'
  gem 'pry-nav'
  gem 'spring'
  gem "spring-commands-rspec"
  gem 'faker'
  gem 'rack-livereload'

  gem 'rb-fsevent'
  gem 'guard-bundler'
  gem 'guard-livereload'

  gem 'annotate', ">=2.5.0"

  gem 'guard-annotate'
  gem 'database_cleaner'
end

group :test do
  # Pretty printed test output
  gem 'minitest'
  gem 'turn', :require => false
end
