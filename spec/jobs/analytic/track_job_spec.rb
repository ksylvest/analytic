# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Analytic::TrackJob do
  describe '#perform' do
    subject(:perform) { described_class.perform_now(session_id:, visitor_id:, host:, path:, ip:) }

    let(:session_id) { SecureRandom.uuid }
    let(:visitor_id) { SecureRandom.uuid }
    let(:host) { 'localhost' }
    let(:path) { '/path' }
    let(:ip) { '0.0.0.0' }

    it { expect { perform }.to change(Analytic::Event.where(session_id:, visitor_id:, host:, path:, ip:), :count) }
  end
end
