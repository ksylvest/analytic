# frozen_string_literal: true

module Analytic
  class Config
    # @return [ActiveSupport::TimeZone]
    attr_accessor :time_zone

    # @return [Integer]
    attr_accessor :ip_v4_mask

    # @return [Integer]
    attr_accessor :ip_v6_mask

    # @return [Array<Rack::Middleware>]
    attr_accessor :middleware

    # @return [Array]
    attr_accessor :params

    def initialize
      @time_zone = Time.zone
      @ip_v4_mask = 24 # e.g. 255.255.255.255 => '255.255.255.0/255.255.255.0'
      @ip_v6_mask = 48 # e.g. 'ffff:ffff:ffff:ffff:ffff:ffff:ffff:ffff' => 'ffff:ffff:ffff:0000:0000:0000:0000:0000'
      @middleware = []
      @params = %i[utm_source utm_medium utm_campaign utm_content utm_term ref source]
    end

    # @return [Boolean]
    def ip_v4_mask?
      @ip_v4_mask.present?
    end

    # @return [Boolean]
    def ip_v6_mask?
      @ip_v6_mask.present?
    end

    # @param middleware [Rack::Middleware]
    def use(*args, &block)
      middleware << [args, block]
    end
  end
end
