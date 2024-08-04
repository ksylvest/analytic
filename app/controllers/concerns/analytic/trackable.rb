# frozen_string_literal: true

module Analytic
  module Trackable
    # @param params [Hash]
    def analytic_track!(params: {})
      Analytic::View.create!(
        timestamp: Time.current,
        session_id: analytic_session_id,
        visitor_id: analytic_visitor_id,
        host: request.host,
        path: request.path,
        params:
      )
    end

    # @param params [Hash]
    def analytic_enqueue_track_job!(params: {})
      Analytic::TrackJob.perform_later(
        session_id: analytic_session_id,
        visitor_id: analytic_visitor_id,
        host: request.host,
        path: request.path,
        params:
      )
    end

    # @return [String]
    def analytic_session_id
      session[:analytic_session_id] ||= SecureRandom.uuid
    end

    # @return [String]
    def analytic_visitor_id
      cookies.permanent[:analytic_visitor_id] ||= SecureRandom.uuid
    end
  end
end
