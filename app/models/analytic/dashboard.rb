# frozen_string_literal: true

module Analytic
  class Dashboard
    PAGES_LIMIT = 8

    # @return [String]
    attr_reader :period

    # @param period [String] today, yesterday, week, month, year
    def initialize(period:)
      @period = period
    end

    # @return [Integer]
    delegate :count, to: :views

    # @return [Integer]
    delegate :distinct_visitors_count, to: :views

    # @return [Integer]
    delegate :distinct_sessions_count, to: :views

    # @return [String]
    def name
      if @period
        "#{@period.capitalize} | Dashboard"
      else
        'Dashboard'
      end
    end

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

    # @return [Analytic::View::ActiveRecord_Relation]
    def views
      @views ||= Analytic::View.within(range)
    end

    # @return [Range<Time>]
    def range
      return unless @period

      case @period
      when 'today' then time_zone.today.all_day
      when 'yesterday' then time_zone.yesterday.all_day
      when 'week' then time_zone.now.all_week
      when 'month' then time_zone.now.all_month
      when 'year' then time_zone.now.all_year
      end
    end

    # @return [ActiveSupport::TimeZone]
    def time_zone
      @time_zone ||= Analytic.config.time_zone || Time.zone
    end
  end
end
