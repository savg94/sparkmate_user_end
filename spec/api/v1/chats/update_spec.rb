require "rails_helper"

RSpec.describe "chats#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/chats/#{chat.id}", payload
  end

  describe "basic update" do
    let!(:chat) { create(:chat) }

    let(:payload) do
      {
        data: {
          id: chat.id.to_s,
          type: "chats",
          attributes: {
            # ... your attrs here
          },
        },
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit "updates the resource" do
      expect(ChatResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { chat.reload.attributes }
    end
  end
end
