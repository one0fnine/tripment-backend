# frozen_string_literal: true

RSpec.describe Adapters::Main do
  subject(:instance) { described_class.new(data) }

  describe '#call' do
    context 'with blank data' do
      let(:data) { nil }

      it 'returns empty array' do
        expect(instance.call).to eq []
      end
    end

    context 'with wiki data' do
      let(:data) { Proxies::Wikipedia.new.call }
      let(:result) do
        [{ name: 'Acupuncture' }, { name: 'Angiography' }, { name: 'Biopsy' }]
      end

      around do |example|
        VCR.use_cassette('wikipedia', &example)
      end

      it 'returns procedures name' do
        expect(instance.call).to include(*result)
      end
    end
  end
end
