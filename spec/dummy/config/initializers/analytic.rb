# frozen_string_literal: true

Analytic.configure do |config|
  config.time_zone = Time.find_zone(ENV.fetch('ANALYTIC_TIMEZONE', 'Canada/Pacific'))
end
