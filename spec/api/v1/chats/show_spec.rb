require "rails_helper"

RSpec.describe "chats#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/chats/#{chat.id}", params: params
  end

  describe "basic fetch" do
    let!(:chat) { create(:chat) }

    it "works" do
      expect(ChatResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq("chats")
      expect(d.id).to eq(chat.id)
    end
  end
end
