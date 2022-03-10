require "rails_helper"

RSpec.describe "providers#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/providers/#{provider.id}", payload
  end

  describe "basic update" do
    let!(:provider) { create(:provider) }

    let(:payload) do
      {
        data: {
          id: provider.id.to_s,
          type: "providers",
          attributes: {
            # ... your attrs here
          },
        },
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit "updates the resource" do
      expect(ProviderResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { provider.reload.attributes }
    end
  end
end
