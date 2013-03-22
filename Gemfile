source 'http://rubygems.org'
ruby "2.0.0"

gem 'rails', '4.0.0.beta1'

gem 'pg'
gem 'pg_search', :git => 'git://github.com/Casecommons/pg_search.git'

gem 'devise', :git => 'git://github.com/plataformatec/devise.git', :branch => "rails4"

gem 'omniauth'
gem 'omniauth-twitter'
gem 'omniauth-facebook'
gem 'omniauth-google-oauth2'
gem 'heroku'
gem 'haml', '4.0.1.rc.1'
gem 'bluecloth'
gem 'paper_trail', :git => 'git://github.com/airblade/paper_trail.git', :branch => 'rails4'
gem 'state_machine'
gem 'cancan'
gem 'taps'
gem 'will_paginate'
gem 'timeago', :git => 'git://github.com/orbanbotond/timeago.git'
gem "jquery_mobile-rails"

group :development do
  gem 'quiet_assets'
  gem 'sqlite3'
end

gem 'coffee-rails', '4.0.0.beta1'
# Gems used only for assets and not required
# in production environments by default.

group :assets do
  gem 'sass-rails', '4.0.0.beta1'
  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# Use unicorn as the web server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
gem 'pry'

gem 'pry'

group :development do
  gem 'pry-nav'
  gem 'rb-readline'
end

group :development, :test do
  gem 'faker'
  gem 'rack-livereload'
  gem 'guard'
  gem 'guard-bundler'
  gem 'guard-livereload'

  gem 'annotate', :git => 'git://github.com/ctran/annotate_models.git'
  gem 'guard-annotate'
  gem "rb-fsevent"
  gem 'database_cleaner'

  # gem 'sqlite3', :require => 'sqlite3'
end

group :test do
  # Pretty printed test output
  gem 'minitest'
  gem 'turn', :require => false
end
