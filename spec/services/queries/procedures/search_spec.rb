# frozen_string_literal: true

RSpec.describe Queries::Procedures::Search do
  subject(:instance) { described_class.new(name) }

  describe '#call' do
    context 'when search by name' do
      let(:name) { 'lo' }

      before do
        create :procedure, name: 'Blood test'
        create :procedure, name: 'Colonoscopy'
        create :procedure, name: 'Lobotomy'
        create :procedure, name: 'Test'
      end

      it 'returns objects containing the substring' do
        expect(instance.call.pluck(:name)).not_to include('Test')
      end

      it 'returns object starting with the substring in first position' do
        expect(instance.call.pick(:name)).to eq 'Lobotomy'
      end
    end
  end
end
