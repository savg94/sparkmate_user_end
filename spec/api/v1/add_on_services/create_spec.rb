require "rails_helper"

RSpec.describe "add_on_services#create", type: :request do
  subject(:make_request) do
    jsonapi_post "/api/v1/add_on_services", payload
  end

  describe "basic create" do
    let(:params) do
      {
        # ... your attrs here
      }
    end
    let(:payload) do
      {
        data: {
          type: "add_on_services",
          attributes: params,
        },
      }
    end

    it "works" do
      expect(AddOnServiceResource).to receive(:build).and_call_original
      expect do
        make_request
        expect(response.status).to eq(201), response.body
      end.to change { AddOnService.count }.by(1)
    end
  end
end
