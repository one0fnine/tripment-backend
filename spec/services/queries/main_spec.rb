# frozen_string_literal: true

RSpec.describe Queries::Main do
  subject(:instance) { described_class.new }

  describe '#call' do
    context 'when #url is not defined' do
      it 'returns error' do
        expect { instance.call }.to raise_error(NotImplementedError)
      end
    end
  end
end
