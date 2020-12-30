# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.2'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 6.1'
# Use Puma as the app server
gem 'puma', '~> 4.1'
# Transpile app-like JavaScript. Read more: https://github.com/rails/webpacker
gem 'webpacker', '~> 4.0'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
# gem 'jbuilder', '~> 2.7'
gem 'jsonapi-serializer', '~> 2.1'

# Use Active Model has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.2', require: false

# Integration
gem 'typhoeus', '~> 1.4'

# Parsing
gem 'oj', '~> 3.10'

# DB
# Use postgresql as the database for Active Record
gem 'activerecord-import', '~> 1.0'
gem 'pg', '>= 0.18', '< 2.0'
gem 'strong_migrations', '~> 0.7'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  # gem 'byebug', platforms: %i[mri mingw x64_mingw]
  # Debugging
  gem 'pry', '~> 0.13'
  gem 'pry-byebug', '~> 3.0'
  gem 'pry-rails', '~> 0.3'

  # Testing
  gem 'factory_bot_rails', '~> 6.1'
  gem 'json_matchers', '~> 0.11', require: false
  gem 'rspec-rails', '~> 4.0'
  gem 'shoulda-matchers', '~> 4.4', require: false
  gem 'vcr', '~> 6.0', require: false
  gem 'webmock', '~> 3.11', require: false
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'listen', '~> 3.2'
  gem 'web-console', '>= 3.3.0'

  # Linters
  gem 'brakeman', '~> 4.8', require: false
  gem 'bundler-audit', '~> 0.7', require: false
  gem 'lefthook', '~> 0.7', require: false
  gem 'rubocop', '~> 1.7', require: false
  gem 'rubocop-performance', '~> 1.9', require: false
  gem 'rubocop-rails', '~> 2.9', require: false
  gem 'rubocop-rspec', '~> 2.1', require: false
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
