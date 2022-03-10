require "rails_helper"

RSpec.describe "requests#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/requests", params: params
  end

  describe "basic fetch" do
    let!(:request1) { create(:request) }
    let!(:request2) { create(:request) }

    it "works" do
      expect(RequestResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(["requests"])
      expect(d.map(&:id)).to match_array([request1.id, request2.id])
    end
  end
end
