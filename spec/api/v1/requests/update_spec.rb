require 'rails_helper'

RSpec.describe "requests#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/requests/#{request.id}", payload
  end

  describe 'basic update' do
    let!(:request) { create(:request) }

    let(:payload) do
      {
        data: {
          id: request.id.to_s,
          type: 'requests',
          attributes: {
            # ... your attrs here
          }
        }
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit 'updates the resource' do
      expect(RequestResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { request.reload.attributes }
    end
  end
end
