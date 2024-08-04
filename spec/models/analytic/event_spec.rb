# frozen_string_literal: true

require 'spec_helper'

module Analytic
  RSpec.describe Event do
    subject(:event) { build(:analytic_event) }
    it { is_expected.to be_valid }
    it { is_expected.to validate_presence_of(:visitor_id) }
    it { is_expected.to validate_presence_of(:session_id) }
    it { is_expected.to validate_presence_of(:ip) }
  end
end
