# frozen_string_literal: true

FactoryBot.define do
  factory :analytic_config, class: 'Analytic::Config' do
    initialize_with { Analytic::Config.new }
  end
end
