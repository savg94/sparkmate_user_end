require "rails_helper"

RSpec.describe "gigs#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/gigs/#{gig.id}", payload
  end

  describe "basic update" do
    let!(:gig) { create(:gig) }

    let(:payload) do
      {
        data: {
          id: gig.id.to_s,
          type: "gigs",
          attributes: {
            # ... your attrs here
          },
        },
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit "updates the resource" do
      expect(GigResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { gig.reload.attributes }
    end
  end
end
