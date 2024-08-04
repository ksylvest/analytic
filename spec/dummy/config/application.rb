require_relative "boot"

require "rails/all"

Bundler.require(*Rails.groups)

module Dummy
  class Application < Rails::Application
    config.load_defaults Float("#{Rails::VERSION::MAJOR}.#{Rails::VERSION::MINOR}")
    config.autoload_lib(ignore: %w(assets tasks))
  end
end
