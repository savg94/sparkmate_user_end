require "rails_helper"

RSpec.describe "providers#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/providers", params: params
  end

  describe "basic fetch" do
    let!(:provider1) { create(:provider) }
    let!(:provider2) { create(:provider) }

    it "works" do
      expect(ProviderResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(["providers"])
      expect(d.map(&:id)).to match_array([provider1.id, provider2.id])
    end
  end
end
