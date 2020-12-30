# frozen_string_literal: true

RSpec.describe Import::Procedure do
  subject(:instance) { described_class.new }

  describe '#call' do
    context 'with wiki data' do
      let(:stub_proxy) { instance_double Proxies::Wikipedia, call: proxy_data }
      let(:stub_adapter) { instance_double Adapters::Main, call: adapter_data }
      let(:stub_query) { instance_double Queries::Procedures::BulkInsert, call: adapter_data }
      let(:proxy_data) { { 'parse' => { 'links' => [] } } }
      let(:adapter_data) { [{ name: 'Acupuncture' }, { name: 'Angiography' }, { name: 'Biopsy' }] }

      before do
        allow(Proxies::Wikipedia).to receive(:new).and_return(stub_proxy)
        allow(Adapters::Main).to receive(:new).with(proxy_data).and_return(stub_adapter)
        allow(Queries::Procedures::BulkInsert)
          .to receive(:new).with(adapter_data).and_return(stub_query)
      end

      it 'calls proxy service without attributes' do
        instance.call

        expect(stub_proxy).to have_received(:call).with(no_args).once
        expect(Proxies::Wikipedia).to have_received(:new).with(no_args)
      end

      it 'calls adapter service with proxy data' do
        instance.call

        expect(stub_adapter).to have_received(:call).with(no_args).once
        expect(Adapters::Main).to have_received(:new).with(proxy_data)
      end

      it 'calls query service with prepared data' do
        instance.call

        expect(stub_proxy).to have_received(:call).with(no_args).once
        expect(Queries::Procedures::BulkInsert).to have_received(:new).with(adapter_data)
      end
    end
  end
end
