# frozen_string_literal: true

require 'analytic/config'
require 'analytic/version'
require 'analytic/engine'

module Analytic
  # @return [Analytic::Config]
  def self.config
    @config ||= Config.new
  end

  # @yield [config]
  # @yieldparam config [Analytic::Config]
  def self.configure
    yield config
  end
end
