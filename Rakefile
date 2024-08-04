# frozen_string_literal: true

require 'bundler/setup'

require 'bundler/gem_tasks'
require 'rspec/core/rake_task'
require 'rubocop/rake_task'

RSpec::Core::RakeTask.new(:spec)

RuboCop::RakeTask.new

APP_RAKEFILE = File.expand_path('spec/dummy/Rakefile', __dir__)

load 'rails/tasks/engine.rake'
load 'rails/tasks/statistics.rake'

task default: %i[spec rubocop]
