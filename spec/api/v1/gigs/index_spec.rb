require "rails_helper"

RSpec.describe "gigs#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/gigs", params: params
  end

  describe "basic fetch" do
    let!(:gig1) { create(:gig) }
    let!(:gig2) { create(:gig) }

    it "works" do
      expect(GigResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(["gigs"])
      expect(d.map(&:id)).to match_array([gig1.id, gig2.id])
    end
  end
end
