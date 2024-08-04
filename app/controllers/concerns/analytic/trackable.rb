# frozen_string_literal: true

module Analytic
  module Trackable
    # @param params [Hash]
    def analytic_track!
      Analytic::Event.create!(
        timestamp: Time.current,
        session_id: analytic_session_id,
        visitor_id: analytic_visitor_id,
        ip: analytic_ip,
        host: analytic_host,
        path: analytic_path,
        referrer: analytic_referrer,
        user_agent: request.user_agent,
        params: analytic_params
      )
    end

    # @param params [Hash]
    def analytic_enqueue_track_job!
      Analytic::TrackJob.perform_later(
        session_id: analytic_session_id,
        visitor_id: analytic_visitor_id,
        ip: analytic_ip,
        host: analytic_host,
        path: analytic_path,
        referrer: analytic_referrer,
        user_agent: request.user_agent,
        params: analytic_params
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

    # @return [IPAddr]
    def analytic_ip
      ip_addr = IPAddr.new(request.remote_ip)

      return ip_addr.mask(Analytic.config.ip_v4_mask) if Analytic.config.ip_v4_mask? && ip_addr.ipv4?
      return ip_addr.mask(Analytic.config.ip_v6_mask) if Analytic.config.ip_v6_mask? && ip_addr.ipv6?

      ip_addr
    end

    # @return [String]
    def analytic_host
      request.host
    end

    # @return [String]
    def analytic_path
      request.path
    end

    # @return [String]
    def analytic_referrer
      request.referer
    end

    # @return [String]
    def analytic_user_agent
      request.user_agent
    end

    # @return [Hash]
    def analytic_params
      params.slice(*Analytic.config.params)
    end
  end
end
