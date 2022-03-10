require "rails_helper"

RSpec.describe "requests#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/requests/#{request.id}", params: params
  end

  describe "basic fetch" do
    let!(:request) { create(:request) }

    it "works" do
      expect(RequestResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq("requests")
      expect(d.id).to eq(request.id)
    end
  end
end
