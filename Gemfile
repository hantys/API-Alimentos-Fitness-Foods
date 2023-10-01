source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.2.2'

# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem 'rails', '~> 7.0.8'

# Use postgresql as the database for Active Record
gem 'pg', '~> 1.1'

# Use the Puma web server [https://github.com/puma/puma]
gem 'puma', '~> 5.0'

# https://github.com/rails-api/active_model_serializers/tree/0-10-stable/docs
gem 'active_model_serializers'

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', require: false

# Use Redis adapter to run Action Cable in production
gem 'redis', '4.5.1'

# https://github.com/jwt/ruby-jwt
gem 'jwt'

# https://github.com/mperham/sidekiq
gem 'sidekiq', '~> 6.2.1'

# https://github.com/moove-it/sidekiq-scheduler
gem 'sidekiq-scheduler', '~> 3.1.0'

# https://github.com/ondrejbartas/sidekiq-cron
gem 'sidekiq-cron', '~> 1.8.0'

# Use Active Storage variants [https://guides.rubyonrails.org/active_storage_overview.html#transforming-images]
# gem "image_processing", "~> 1.2"

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
gem 'rack-cors'

group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem 'debug', platforms: %i[mri mingw x64_mingw]

  # https://github.com/faker-ruby/faker
  gem 'faker'

  # https://github.com/ffaker/ffaker
  gem 'ffaker'

  gem 'systemu'

  # https://github.com/kaminari/kaminari
  gem 'kaminari'

  gem 'pry-rails'

  # RSpec for Rails-3+ https://github.com/rspec/rspec-rails
  gem 'rspec-rails'

  gem 'rspec-json_expectations'

  # Collection cardinality matchers, extracted from rspec-expectations
  # https://github.com/rspec/rspec-collection_matchers
  gem 'rspec-collection_matchers'

  # Code style checking for RSpec files
  # https://github.com/rubocop-hq/rubocop-rspec
  gem 'rubocop-rspec'

  # https://github.com/thoughtbot/factory_bot_rails
  gem 'factory_bot_rails'

  # https://github.com/rails/rails-controller-testing
  gem 'rails-controller-testing'

  # https://matchers.shoulda.io, https://github.com/thoughtbot/shoulda-matchers
  gem 'shoulda'
  gem 'shoulda-matchers'

  # https://github.com/exoego/rspec-openapi
  gem 'rspec-openapi'

  # A Ruby static code analyzer and formatter, based on the community Ruby style guide.
  # https://docs.rubocop.org
  # https://github.com/rubocop-hq/rubocop
  gem 'rubocop', '~> 1.48', require: false

  # A RuboCop extension focused on enforcing Rails best practices and coding conventions.
  # https://github.com/rubocop-hq/rubocop-rails
  gem 'rubocop-rails'
end

group :development do
  # Speed up commands on slow machines / big apps [https://github.com/rails/spring]
  # gem "spring"

  # https://github.com/flyerhzm/bullet
  gem 'bullet'
end
