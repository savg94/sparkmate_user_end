require 'rails_helper'

RSpec.describe "add_on_services#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/add_on_services/#{add_on_service.id}"
  end

  describe 'basic destroy' do
    let!(:add_on_service) { create(:add_on_service) }

    it 'updates the resource' do
      expect(AddOnServiceResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { AddOnService.count }.by(-1)
      expect { add_on_service.reload }
        .to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq('meta' => {})
    end
  end
end
