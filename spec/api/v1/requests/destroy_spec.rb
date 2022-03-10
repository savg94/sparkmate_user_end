require "rails_helper"

RSpec.describe "requests#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/requests/#{request.id}"
  end

  describe "basic destroy" do
    let!(:request) { create(:request) }

    it "updates the resource" do
      expect(RequestResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { Request.count }.by(-1)
      expect { request.reload }.
        to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq("meta" => {})
    end
  end
end
