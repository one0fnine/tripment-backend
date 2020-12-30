# frozen_string_literal: true

RSpec.describe Queries::Procedures::BulkInsert do
  subject(:instance) { described_class.new(data) }

  describe '#call' do
    context 'with wiki adapters data' do
      let(:data) { [{ name: 'Acupuncture' }, { name: 'Angiography' }, { name: 'Biopsy' }] }

      it 'creates new procedures' do
        expect { instance.call }.to change(Procedure, :count).by(3)
      end
    end
  end
end
