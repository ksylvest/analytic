# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Analytic::Config, type: :model do
  subject(:config) { build(:analytic_config) }

  describe 'attributes' do
    it 'uses a default time_zone' do
      expect(config.time_zone).to eq(Time.zone)
    end

    it 'uses a default ip_v4_mask' do
      expect(config.ip_v4_mask).to eq(24)
    end

    it 'uses a default ip_v6_mask' do
      expect(config.ip_v6_mask).to eq(48)
    end

    it 'uses an empty middleware array by default' do
      expect(config.middleware).to eq([])
    end

    it 'uses default params' do
      expect(config.params).to eq(%i[utm_source utm_medium utm_campaign utm_content utm_term ref source])
    end
  end

  describe '#ip_v4_mask?' do
    it 'returns true if ip_v4_mask is present' do
      config.ip_v4_mask = 24
      expect(config.ip_v4_mask?).to be true
    end

    it 'returns false if ip_v4_mask is nil' do
      config.ip_v4_mask = nil
      expect(config.ip_v4_mask?).to be false
    end
  end

  describe '#ip_v6_mask?' do
    it 'returns true if ip_v6_mask is present' do
      config.ip_v6_mask = 48
      expect(config.ip_v6_mask?).to be true
    end

    it 'returns false if ip_v6_mask is nil' do
      config.ip_v6_mask = nil
      expect(config.ip_v6_mask?).to be false
    end
  end

  describe '#connects_to?' do
    it 'returns true if connects_to is present' do
      config.connects_to = { database: { writing: :analytic, reading: :analytic } }
      expect(config.connects_to?).to be true
    end

    it 'returns false if connects_to is nil' do
      config.connects_to = nil
      expect(config.connects_to?).to be false
    end
  end

  describe '#use' do
    it 'registers middleware' do
      expect { config.use(:args) {} }.to(change { config.middleware.size })
    end
  end
end
