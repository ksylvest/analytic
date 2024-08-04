# frozen_string_literal: true

require 'simplecov'

SimpleCov.start do
  add_filter 'spec/dummy'
  enable_coverage :branch
end

ENV['RAILS_ENV'] = 'test'

require_relative "#{__dir__}/dummy/config/environment"

require 'rspec/rails'

ActiveRecord::Migration.maintain_test_schema!

Dir["#{__dir__}/support/**/*.rb"].each { |file| require file }

RSpec.configure do |config|
  config.infer_spec_type_from_file_location!
  config.use_transactional_fixtures = true

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end
