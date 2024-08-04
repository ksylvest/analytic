# frozen_string_literal: true

FactoryBot.define do
  factory :analytic_dashboard, class: 'Analytic::Dashboard' do
    initialize_with { new(period:) }

    period { nil }

    trait :'24h' do
      period { '24h' }
    end

    trait :'7d' do
      period { '7d' }
    end

    trait :'4w' do
      period { '4w' }
    end

    trait :'12m' do
      period { '12m' }
    end
  end
end
