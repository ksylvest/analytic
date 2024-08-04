# frozen_string_literal: true

module Analytic
  class ApplicationRecord < ActiveRecord::Base
    self.abstract_class = true

    connects_to(**Analytic.config.connects_to) if Analytic.config.connects_to?
  end
end
