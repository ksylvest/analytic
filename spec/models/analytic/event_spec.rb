# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Analytic::Event do
  subject { build(:analytic_event) }

  it { is_expected.to be_valid }

  it { is_expected.to validate_presence_of(:visitor_id) }
  it { is_expected.to validate_presence_of(:session_id) }
  it { is_expected.to validate_presence_of(:ip) }
  it { is_expected.to validate_presence_of(:host) }
  it { is_expected.to validate_presence_of(:path) }

  describe '.distinct_visitors_count' do
    subject(:distinct_visitors_count) { described_class.distinct_visitors_count }

    context 'without any events' do
      it { expect(distinct_visitors_count).to eq(0) }
    end

    context 'with some events' do
      let!(:events) { create_pair(:analytic_event) }

      it { expect(distinct_visitors_count).to eq(events.count) }
    end
  end

  describe '.distinct_sessions_count' do
    subject(:distinct_sessions_count) { described_class.distinct_sessions_count }

    context 'without any events' do
      it { expect(distinct_sessions_count).to eq(0) }
    end

    context 'with some events' do
      let!(:events) { create_pair(:analytic_event) }

      it { expect(distinct_sessions_count).to eq(events.count) }
    end
  end
end
