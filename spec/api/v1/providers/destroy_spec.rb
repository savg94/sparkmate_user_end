require 'rails_helper'

RSpec.describe "providers#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/providers/#{provider.id}"
  end

  describe 'basic destroy' do
    let!(:provider) { create(:provider) }

    it 'updates the resource' do
      expect(ProviderResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { Provider.count }.by(-1)
      expect { provider.reload }
        .to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq('meta' => {})
    end
  end
end
