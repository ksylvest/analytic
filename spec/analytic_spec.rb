# frozen_string_literal: true

RSpec.describe Analytic do
  it 'has a version number' do
    expect(described_class::VERSION).not_to be_nil
  end

  describe '.config' do
    it 'returns the config' do
      expect(described_class.config).to be_a(Analytic::Config)
    end
  end

  describe '.configure' do
    it 'yields the config' do
      expect { |block| described_class.configure(&block) }.to yield_with_args(Analytic::Config)
    end
  end
end
