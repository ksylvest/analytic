# frozen_string_literal: true

module Analytic
  class Event < ApplicationRecord
    validates :timestamp, presence: true
    validates :visitor_id, presence: true
    validates :session_id, presence: true
    validates :path, presence: true
    validates :host, presence: true
    validates :ip, presence: true

    scope :within, ->(range) { where(timestamp: range) if range }

    # @return [Integer]
    def self.distinct_visitors_count
      count('DISTINCT "analytic_events"."visitor_id"')
    end

    # @return [Integer]
    def self.distinct_sessions_count
      count('DISTINCT "analytic_events"."session_id"')
    end
  end
end
