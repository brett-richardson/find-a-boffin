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
    config.use_transactional_fixtures = true
    config.order = "random"
  end
end


Spork.each_run do
  Dir[ Rails.root.join("spec/support/**/*.rb") ].each{ |f| require f }
end
