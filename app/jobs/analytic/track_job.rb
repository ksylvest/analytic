# frozen_string_literal: true

module Analytic
  class TrackJob < ApplicationJob
    queue_as :default

    # @param timestamp [Timestamp]
    # @param session_id [String]
    # @param visitor_id [String]
    # @param host [String]
    # @param path [String]
    # @param params [Hash]
    def perform(session_id:, visitor_id:, host:, path:, timestamp: Time.current, params: {})
      Analytic::View.create!(
        session_id:,
        visitor_id:,
        host:,
        path:,
        params:
      )
    end
  end
end
