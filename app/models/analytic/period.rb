# frozen_string_literal: true

module Analytic
  class Period
    PAGES_LIMIT = 8

    # @return [Range <Time>]
    attr_accessor :range

    # @param dates [Range<Time>]
    def initialize(range:)
      @range = range
    end

    # @return [Integer]
    delegate :count, to: :views

    # @return [Integer]
    delegate :distinct_visitors_count, to: :views

    # @return [Integer]
    delegate :distinct_sessions_count, to: :views

    # @return [Array<Array(String, String, Integer)>]
    def pages
      views
        .group(:host)
        .group(:path)
        .order(count: :desc)
        .limit(PAGES_LIMIT)
        .pluck(:host, :path, Arel.sql('COUNT(*) AS count'))
    end

    protected

    # @return [Analytic::Event::ActiveRecord_Relation]
    def views
      @views ||= Analytic::Event.within(@range)
    end
  end
end
