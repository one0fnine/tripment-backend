# frozen_string_literal: true

RSpec.describe Proxies::Wikipedia do
  describe '#call' do
    subject(:instance) { described_class.new }

    let(:request_params) do
      {
        action: 'parse',
        page: 'Medical_procedure',
        format: 'json',
        section: 2,
        prop: 'links'
      }
    end

    context 'with wiki url and request params' do
      it 'makes request to wikipedia service' do
        stub = stub_request(:get, 'https://en.wikipedia.org/w/api.php').with(query: request_params)
        instance.call

        expect(stub).to have_been_requested
      end
    end
  end
end
