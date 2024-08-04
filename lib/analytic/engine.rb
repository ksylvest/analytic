# frozen_string_literal: true

module Analytic
  class Engine < ::Rails::Engine
    isolate_namespace Analytic

    config.generators do |g|
      g.test_framework :rspec
    end
  end
end
