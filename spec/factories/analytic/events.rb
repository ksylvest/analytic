# frozen_string_literal: true

FactoryBot.define do
  factory :analytic_event, class: 'Analytic::Event' do
    visitor_id { SecureRandom.uuid }
    session_id { SecureRandom.uuid }
    ip { '0.0.0.0' }
    path { '/' }
    host { 'localhost' }
    timestamp { Time.current }
  end
end
