# frozen_string_literal: true

module Analytic
  class Config
    # @return [String]
    attr_accessor :timezone

    # @return [Integer]
    attr_accessor :ip_v4_mask

    # @return [Integer]
    attr_accessor :ip_v6_mask

    def initialize
      @timezone = Time.zone
      @ip_v4_mask = 24 # e.g. 255.255.255.255 => '255.255.255.0/255.255.255.0'
      @ip_v6_mask = 48 # e.g. 'ffff:ffff:ffff:ffff:ffff:ffff:ffff:ffff' => 'ffff:ffff:ffff:0000:0000:0000:0000:0000'
    end

    # @return [Boolean]
    def ip_v4_mask?
      @ip_v4_mask.present?
    end

    # @return [Boolean]
    def ip_v6_mask?
      @ip_v6_mask.present?
    end
  end
end
