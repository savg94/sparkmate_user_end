require "rails_helper"

RSpec.describe "gigs#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/gigs/#{gig.id}", params: params
  end

  describe "basic fetch" do
    let!(:gig) { create(:gig) }

    it "works" do
      expect(GigResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq("gigs")
      expect(d.id).to eq(gig.id)
    end
  end
end
