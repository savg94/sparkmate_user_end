require 'rails_helper'

RSpec.describe "add_on_services#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/add_on_services/#{add_on_service.id}", payload
  end

  describe 'basic update' do
    let!(:add_on_service) { create(:add_on_service) }

    let(:payload) do
      {
        data: {
          id: add_on_service.id.to_s,
          type: 'add_on_services',
          attributes: {
            # ... your attrs here
          }
        }
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit 'updates the resource' do
      expect(AddOnServiceResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { add_on_service.reload.attributes }
    end
  end
end
