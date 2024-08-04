# frozen_string_literal: true

module Analytic
  class Chart
    include ActiveModel::Model

    # @param scope [ActiveRecord::Relation]
    def initialize(scope:)
      @scope = scope
    end

    # @return [Array<Hash<{ label: String, value: Integer }>>]
    def entries
      [
        { label: 'Jan, 2024', value: 292 },
        { label: 'Feb, 2024', value: 303 },
        { label: 'Mar, 2024', value: 250 },
        { label: 'Apr, 2024', value: 304 },
        { label: 'May, 2024', value: 404 },
        { label: 'Jun, 2024', value: 604 }
      ]
    end
  end
end
