# frozen_string_literal: true

module Analytic
  class Stat
    # @param current [Integer]
    # @param prior [Integer]
    # @param name [String]
    def initialize(current:, prior:, name:)
      @current = current
      @prior = prior
      @name = name
    end

    # @return [Integer]
    def count
      @current
    end

    # e.g. prior = 4 / current = 5 / delta = + 0.25
    # e.g. prior = 4 / current = 3 / delta = - 0.25
    #
    # @return [Float, nil]
    def delta
      return if @prior.nil?
      return if @prior.zero?

      (@current - @prior).fdiv(@prior)
    end
  end
end
