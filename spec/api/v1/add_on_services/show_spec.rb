require 'rails_helper'

RSpec.describe "add_on_services#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/add_on_services/#{add_on_service.id}", params: params
  end

  describe 'basic fetch' do
    let!(:add_on_service) { create(:add_on_service) }

    it 'works' do
      expect(AddOnServiceResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq('add_on_services')
      expect(d.id).to eq(add_on_service.id)
    end
  end
end
