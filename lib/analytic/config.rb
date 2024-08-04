# frozen_string_literal: true

module Analytic
  class Config
    # @return [String]
    attr_accessor :timezone

    def initialize
      @timezone = Time.zone
    end
  end
end
