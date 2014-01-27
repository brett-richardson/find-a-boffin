require 'rubygems'
require 'spork'


Spork.prefork do
  ENV["RAILS_ENV"] ||= 'test'
  require 'simplecov'
  require File.expand_path("../../config/environment", __FILE__)
  require 'rspec/rails'
  require 'rspec/autorun'

  ActiveRecord::Migration.check_pending! if defined?(ActiveRecord::Migration)

  RSpec.configure do |config|
    config.include FactoryGirl::Syntax::Methods

    config.use_transactional_fixtures = true
    config.order = "random"
  end

  Capybara.configure do |config|
    config.match = :prefer_exact
    config.ignore_hidden_elements = true
  end
end


Spork.each_run do
  Dir[ Rails.root.join("spec/support/**/*.rb") ].each{ |f| require f }
end
