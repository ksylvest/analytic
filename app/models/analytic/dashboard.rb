# frozen_string_literal: true

module Analytic
  class Dashboard
    PAGES_LIMIT = 8

    # @return [String]
    attr_reader :period

    # @param period [String] '24h', '7d', '4w', '12m'
    def initialize(period: nil)
      @period = period
    end

    # @return [Stat]
    def views
      Stat.new(
        current: current.count,
        prior: prior&.count,
        name: 'Views'
      )
    end

    # @return [Stat]
    def visitors
      Stat.new(
        current: current.distinct_visitors_count,
        prior: prior&.distinct_visitors_count,
        name: 'Visitors'
      )
    end

    # @return [Stat]
    def sessions
      Stat.new(
        current: current.distinct_sessions_count,
        prior: prior&.distinct_sessions_count,
        name: 'Sessions'
      )
    end

    # @return [Chart]
    def views_chart
      Chart.new(scope: Analytic::Event.by_day.count)
    end

    # @return [Chart]
    def visitors_chart
      Chart.new(scope: Analytic::Event.by_day.distinct_visitors_count)
    end

    # @return [Chart]
    def sessions_chart
      Chart.new(scope: Analytic::Event.by_day.distinct_sessions_count)
    end

    # @return [String]
    def name
      if @period
        "#{@period.capitalize} | Dashboard"
      else
        'Dashboard'
      end
    end

    # @return [Period]
    def current
      @current ||= Period.new(range:)
    end

    # @return [Period]
    def prior
      return unless range?
      return @prior if defined?(@prior)

      @prior ||= Period.new(range: ((range.min - duration)..(range.max - duration)))
    end

    # @return [Boolean]
    def range?
      @period.present?
    end

    # @return [Range<Time>]
    def range
      (now - duration)..now if range?
    end

    # @return [Interval]
    def duration
      @duration ||=
        case @period
        when '24h' then 24.hours
        when '7d' then 7.days
        when '4w' then 4.weeks
        when '12m' then 12.months
        end
    end

    protected

    # @return [Time]
    def now
      @now ||= time_zone.now
    end

    # @return [ActiveSupport::TimeZone]
    def time_zone
      @time_zone ||= Analytic.config.time_zone || Time.zone
    end
  end
end
