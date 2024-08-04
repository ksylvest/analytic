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

  describe '.within' do
    subject(:within) { described_class.within(range) }

    let(:range) { 5.days.ago..3.days.ago }

    context 'with an event before the range' do
      let!(:event) { create(:analytic_event, timestamp: 6.days.ago) }

      it { expect(within).not_to include(event) }
    end

    context 'with an event inside the range' do
      let!(:event) { create(:analytic_event, timestamp: 4.days.ago) }

      it { expect(within).to include(event) }
    end

    context 'with an event after the range' do
      let!(:event) { create(:analytic_event, timestamp: 2.days.ago) }

      it { expect(within).not_to include(event) }
    end

    context 'without a range' do
      let(:range) { nil }
      let!(:event) { create(:analytic_event) }

      it { expect(within).to include(event) }
    end
  end

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
