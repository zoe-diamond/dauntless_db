require_relative 'boot'

require 'rails/all'

Bundler.require(*Rails.groups)

module DauntlessDb
  class Application < Rails::Application
    config.load_defaults 7.1

    config.action_dispatch.default_headers = {
      'Access-Control-Allow-Origin' => '*',
      'Access-Control-Request-Method' => %w{GET POST OPTIONS}.join(",")
    }
  end
end
