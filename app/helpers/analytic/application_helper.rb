# frozen_string_literal: true

module Analytic
  module ApplicationHelper
    def react(component:)
      tag.div(data: { react: component })
    end

    # @param icon [String] e.g. fa fa-user
    def fa_icon_tag(icon)
      tag.i(class: icon)
    end

    # @param delta [Float]
    # @return [String]
    def delta_icon_tag(delta)
      if delta.zero?
        fa_icon_tag('fa-solid fa-xmark')
      elsif delta.positive?
        fa_icon_tag('fa-solid fa-arrow-up')
      elsif delta.negative?
        fa_icon_tag('fa-solid fa-arrow-down')
      end
    end

    # @param delta [Float]
    # @return [String]
    def delta_percentage_tag(delta)
      tag.span(number_to_percentage(delta.abs * 100.0, precision: 2), class: 'delta__value')
    end

    # @param delta [Float, nil]
    def delta_tag(delta)
      return if delta.nil?

      modifier =
        if delta.zero? then 'delta--neutral'
        elsif delta.positive? then 'delta--positive'
        elsif delta.negative? then 'delta--negative'
        end

      tag.div(class: "delta #{modifier}") do
        concat(delta_icon_tag(delta))
        concat(delta_percentage_tag(delta))
      end
    end
  end
end
