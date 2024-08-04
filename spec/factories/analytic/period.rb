# frozen_string_literal: true

FactoryBot.define do
  factory :analytic_period, class: 'Analytic::Period' do
    initialize_with { new(range:) }

    range { 3.days.ago..2.days.ago }
  end
end
