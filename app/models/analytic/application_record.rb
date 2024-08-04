# frozen_string_literal: true

module Analytic
  class ApplicationRecord < ActiveRecord::Base
    self.abstract_class = true

    connects_to(**Analytic.connects_to) if Analytic.connects_to?
  end
end
