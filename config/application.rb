require File.expand_path('../boot', __FILE__)
require 'rails/all'

# Loads the environment variables present in .env into the ENV[]
if ENV['DYNO'].nil? # Ensure we're not on Heroku, because this causes problems there
  require 'dotenv'
  Dotenv.load
end

Bundler.require(:default, Rails.env)

module ExpertSearch
  class Application < Rails::Application
    I18n.enforce_available_locales = false
  end
end

# Settings in config/environments/* take precedence over those specified here.
# Application configuration should go into files in config/initializers
# -- all .rb files in that directory are automatically loaded.

# Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
# Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
# config.time_zone = 'Central Time (US & Canada)'

# The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
# config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
# config.i18n.default_locale = :de