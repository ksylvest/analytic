# frozen_string_literal: true

require 'simplecov'

SimpleCov.start do
  enable_coverage :branch
end

ENV['RAILS_ENV'] = 'test'

require_relative "#{__dir__}/dummy/config/environment"

ActiveRecord::Migration.maintain_test_schema!

Dir["#{__dir__}/support/**/*.rb"].each { |file| require file }

RSpec.configure do |config|
  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end
