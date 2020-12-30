# frozen_string_literal: true

RSpec.describe Queries::Main do
  subject(:instance) { described_class.new(nil) }

  describe '#call' do
    context 'when #call is not defined' do
      it 'returns error' do
        expect { instance.call }.to raise_error(NotImplementedError)
      end
    end
  end
end
