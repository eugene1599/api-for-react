# frozen_string_literal: true

source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

gem 'devise_token_auth', '~> 1.1', '>= 1.1.3'
gem 'jbuilder'
gem 'mini_magick', '~> 4.8'
gem 'mongoid', '~> 7.0.6'
gem 'mongoid-locker', '~> 2.0'
gem 'puma', '~> 4.3', '>= 4.3.3'
gem 'rack-cors', require: 'rack/cors'
gem 'rails', '~> 6.0', '>= 6.0.2.1'
gem 'carrierwave'
gem 'file_validators'
gem 'cancancan'
gem 'cancancan-mongoid'
gem 'email_validator', '~> 1.6'
gem 'simple_enum'
gem 'blueprinter'

group :development, :test do
  gem 'brakeman'
  gem 'dotenv-rails', '~> 2.2', '>= 2.2.1'
  gem 'ffaker', '~> 2.7'
  gem 'pry-byebug', '~> 3.5', '>= 3.5.1'
  gem 'rubocop', require: false
end

group :test do
  gem 'factory_bot_rails', '~> 4.8', '>= 4.8.2'
  gem 'json_matchers', '~> 0.7.2'
  gem 'rspec-rails', '~> 3.7', '>= 3.7.2'
  gem 'shoulda-matchers', '~> 4.3'
  gem 'simplecov', require: false
  gem 'rails_best_practices', require: false
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

gem "trailblazer"
gem "trailblazer-rails"
gem "reform", ">= 2.2.0"
gem "reform-rails"
gem 'dry-validation'
gem 'dry-auto_inject'

#gem 'mime-types'
