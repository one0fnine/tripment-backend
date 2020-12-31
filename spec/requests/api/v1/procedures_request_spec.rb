# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Procedures', type: :request do
  let(:params) { {} }
  let(:headers) { { 'CONTENT_TYPE': 'application/json', 'ACCEPT': 'application/json' } }

  describe '#index' do
    before do
      create_pair :procedure
      create :procedure, name: 'Test'

      get '/api/v1/procedures', params: params, headers: headers
    end

    context 'when filter is not defined' do
      it 'returns ok status' do
        expect(response).to have_http_status(:ok)
      end

      it 'returns procedures' do
        expect(response).to match_response_schema('procedures')
      end
    end

    context 'with filter' do
      let(:params) { { filter: { name: 'te' } } }
      let(:result) { Oj.load(response.body)['data'] }

      it 'returns procedures with the substring' do
        expect(result.size).to eq 1
      end
    end
  end

  describe '#reload' do
    before do
      put '/api/v1/procedures/reload', params: params, headers: headers
    end

    context 'when update procedures' do
      it 'returns accepted status' do
        expect(response).to have_http_status(:accepted)
      end

      it 'enqueue FetchProceduresJob' do
        expect(FetchProceduresJob).to have_been_enqueued.with(no_args)
      end
    end
  end
end
