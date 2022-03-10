require 'rails_helper'

RSpec.describe "providers#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/providers/#{provider.id}", params: params
  end

  describe 'basic fetch' do
    let!(:provider) { create(:provider) }

    it 'works' do
      expect(ProviderResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq('providers')
      expect(d.id).to eq(provider.id)
    end
  end
end
