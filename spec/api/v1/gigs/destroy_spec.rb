require "rails_helper"

RSpec.describe "gigs#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/gigs/#{gig.id}"
  end

  describe "basic destroy" do
    let!(:gig) { create(:gig) }

    it "updates the resource" do
      expect(GigResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { Gig.count }.by(-1)
      expect { gig.reload }.
        to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq("meta" => {})
    end
  end
end
