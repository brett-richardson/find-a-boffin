source 'https://rubygems.org'
ruby '2.0.0'


#= Project Base ===
gem 'rails', '4.0.2'
gem 'pg'
gem 'rake'
gem 'bundler'

#= Views ===
gem 'simple_form'

#= Backend ===
gem 'inherited_resources' # RESTful controller action inheritance
gem 'googl'               # Goo.gl url shortening

#= Utilities ===
gem 'rb-readline'

#= Assets ===
gem 'sass-rails',   '~> 4.0.0' # Use SCSS for stylesheets
gem 'uglifier',     '>= 1.3.0' # Use Uglifier as compressor for JavaScript assets
gem 'coffee-rails', '~> 4.0.0' # Use CoffeeScript for .js.coffee assets and views
gem 'jquery-rails' # Use jquery as the JavaScript library
gem 'haml-rails'
gem 'turbolinks'   # Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'lodash-rails'
gem 'bootstrap-sass'


#= Production Only ===

group :production do
  gem 'rails_12factor'
end


#= Development & Testing Only ===

group :development do
  gem 'quiet_assets' # Disable assets logs
  gem 'better_errors' # Better development errors
  gem 'binding_of_caller', require: false # Required by better_errors advanced features
  gem 'foreman',           require: false # Procfile support
end

group :development, :test do
  gem 'spork-rails', github: 'sporkrb/spork-rails' # Testing server
  gem 'simplecov', require: false # Code coverage
  gem 'dotenv-rails' # Load environment vars from file
  gem 'teaspoon' # JS testing Rails engine & rake tasks
  gem 'pry' # Rails debugger
  gem 'growl'
  gem 'guard' # File system watcher
  gem 'guard-bundler'
  gem 'guard-spork'
  gem 'guard-rspec'
  gem 'guard-teaspoon'
  gem 'rspec'
  gem 'rspec-rails'
  gem 'capybara' # Acceptance tests
  gem 'selenium-webdriver'
  # gem 'capybara-webkit' # Headless webkit for acceptance testing
  gem 'shoulda-matchers' # RSpec matchers for ActiveRecord
  gem 'factory_girl'
  gem 'factory_girl_rails' # Testing factories
end
