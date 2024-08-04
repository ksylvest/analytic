# frozen_string_literal: true

require 'rails_helper'

module Analytic
  RSpec.describe View do
    subject(:view) { build(:view) }
    it { is_expected.to be_valid }
    it { is_expected.to validate_presence_of(:visitor_id) }
    it { is_expected.to validate_presence_of(:session_id) }
    it { is_expected.to validate_presence_of(:ip) }
  end
end
