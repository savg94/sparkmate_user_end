require "rails_helper"

RSpec.describe "add_on_services#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/add_on_services", params: params
  end

  describe "basic fetch" do
    let!(:add_on_service1) { create(:add_on_service) }
    let!(:add_on_service2) { create(:add_on_service) }

    it "works" do
      expect(AddOnServiceResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(["add_on_services"])
      expect(d.map(&:id)).to match_array([add_on_service1.id,
                                          add_on_service2.id])
    end
  end
end
