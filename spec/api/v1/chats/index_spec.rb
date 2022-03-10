require "rails_helper"

RSpec.describe "chats#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/chats", params: params
  end

  describe "basic fetch" do
    let!(:chat1) { create(:chat) }
    let!(:chat2) { create(:chat) }

    it "works" do
      expect(ChatResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(["chats"])
      expect(d.map(&:id)).to match_array([chat1.id, chat2.id])
    end
  end
end
