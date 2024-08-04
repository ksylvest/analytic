# frozen_string_literal: true

module Analytic
  class Config
    # @example
    #  config.time_zone = ActiveSupport::TimeZone['Tokyo']
    #
    # @!attribute [rw] time_zone
    #   @return [ActiveSupport::TimeZone]
    attr_accessor :time_zone

    # @example
    #  config.ip_v4_mask = 24
    #
    # @!attribute [rw] ip_v4_mask
    #   @return [Integer]
    attr_accessor :ip_v4_mask

    # @example
    #   config.ip_v6_mask = 48
    #
    # @!attribute [rw] ip_v6_mask
    #   @return [Integer]
    attr_accessor :ip_v6_mask

    # @example
    #   config.connects_to = database: { writing: :primary, reading: :replica }
    #
    # @!attribute [rw] connects_to
    #   @return [Hash, nil]
    attr_accessor :connects_to

    # @!attribute [rw] middleware
    #   @return [Array<Rack::Middleware>]
    attr_accessor :middleware

    # @example
    #  config.params = %i[utm_source utm_medium utm_campaign utm_content utm_term ref source]
    #
    # @!attribute [rw] params
    #   @return [Array<Symbol>]
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

    # @return [Boolean]
    def connects_to?
      @connects_to.present?
    end

    # @param middleware [Rack::Middleware]
    def use(*args, &block)
      middleware << [args, block]
    end
  end
end
