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

    context 'with url and request params' do
      it 'makes request to wikipedia service' do
        stub = stub_request(:get, 'https://en.wikipedia.org/w/api.php').with(query: request_params)
        instance.call

        expect(stub).to have_been_requested
      end
    end

    context 'with wrong url or request params' do
      it 'returns error request' do
        stub_request(:get, 'https://en.wikipedia.org/w/api.php')
          .with(query: request_params)
          .to_return(status: 404)

        expect { instance.call }.to raise_error(RequestError)
      end
    end
  end
end
