# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Analytic::Stat do
  subject(:stat) { build(:analytic_stat) }

  describe '#count' do
    it { expect(stat.count).to eq(3) }
  end

  describe '#delta' do
    it { expect(stat.delta).to eq(0.5) }
  end
end
