# frozen_string_literal: true

FactoryBot.define do
  factory :analytic_stat, class: 'Analytic::Stat' do
    initialize_with { new(current:, prior:, name:) }

    current { 3 }
    prior { 2 }
    name { 'Views' }
  end
end
