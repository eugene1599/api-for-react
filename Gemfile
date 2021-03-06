# frozen_string_literal: true

source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

gem 'devise_token_auth', '~> 0.1.42'
gem 'i18n', '~> 0.9.1'
gem 'jbuilder'
gem 'mini_magick', '~> 4.8'
gem 'pg', '~> 0.21.0'
gem 'puma', '~> 3.7'
gem 'rack-cors', require: 'rack/cors'
gem 'rails', '~> 5.1', '>= 5.1.6'
gem 'carrierwave'
gem 'file_validators'
gem 'cancancan'
gem 'email_validator', '~> 1.6'

group :development, :test do
  gem 'brakeman'
  gem 'dotenv-rails', '~> 2.2', '>= 2.2.1'
  gem 'ffaker', '~> 2.7'
  gem 'pry-byebug', '~> 3.5', '>= 3.5.1'
  gem 'rubocop', require: false
end

group :test do
  gem 'database_cleaner', '~> 1.6.1'
  gem 'factory_bot_rails', '~> 4.8', '>= 4.8.2'
  gem 'json_matchers', '~> 0.7.2'
  gem 'rspec-rails', '~> 3.7', '>= 3.7.2'
  gem 'shoulda-matchers', github: 'thoughtbot/shoulda-matchers', branch: 'rails-5'
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
