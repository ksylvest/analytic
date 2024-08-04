# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Analytic::Period do
  subject(:period) { build(:analytic_period) }

  describe '#count' do
    it { expect(period.count).to eq(0) }
  end

  describe '#distinct_visitors_count' do
    it { expect(period.distinct_visitors_count).to eq(0) }
  end

  describe '#distinct_sessions_count' do
    it { expect(period.distinct_sessions_count).to eq(0) }
  end

  describe '#pages' do
    it { expect(period.pages).to be_a(Array) }
  end
end
