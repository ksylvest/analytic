# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Analytic::Dashboard do
  subject(:dashboard) { build(:analytic_dashboard, :'7d') }

  describe '#views' do
    it { expect(dashboard.views).to be_a(Analytic::Stat) }
  end

  describe '#visitors' do
    it { expect(dashboard.visitors).to be_a(Analytic::Stat) }
  end

  describe '#sessions' do
    it { expect(dashboard.sessions).to be_a(Analytic::Stat) }
  end

  describe '#views_chart' do
    it { expect(dashboard.views_chart).to be_a(Analytic::Chart) }
  end

  describe '#visitors_chart' do
    it { expect(dashboard.visitors_chart).to be_a(Analytic::Chart) }
  end

  describe '#sessions_chart' do
    it { expect(dashboard.sessions_chart).to be_a(Analytic::Chart) }
  end

  describe '#name' do
    context 'without a period' do
      let(:dashboard) { build(:analytic_dashboard) }

      it { expect(dashboard.name).to eq('Dashboard') }
    end

    context 'with a period' do
      let(:dashboard) { build(:analytic_dashboard, :'24h') }

      it { expect(dashboard.name).to eq('24h | Dashboard') }
    end
  end

  describe '#duration' do
    context 'without a period' do
      let(:dashboard) { build(:analytic_dashboard) }

      it { expect(dashboard.duration).to be_nil }
    end

    context 'with a 24h period' do
      let(:dashboard) { build(:analytic_dashboard, :'24h') }

      it { expect(dashboard.duration).to eq(24.hours) }
    end

    context 'with a 7d period' do
      let(:dashboard) { build(:analytic_dashboard, :'7d') }

      it { expect(dashboard.duration).to eq(7.days) }
    end

    context 'with a 4w period' do
      let(:dashboard) { build(:analytic_dashboard, :'4w') }

      it { expect(dashboard.duration).to eq(4.weeks) }
    end

    context 'with a 12m period' do
      let(:dashboard) { build(:analytic_dashboard, :'12m') }

      it { expect(dashboard.duration).to eq(12.months) }
    end
  end
end
