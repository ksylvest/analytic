# frozen_string_literal: true

module Analytic
  class ApplicationRecord < ActiveRecord::Base
    self.abstract_class = true
  end
end
