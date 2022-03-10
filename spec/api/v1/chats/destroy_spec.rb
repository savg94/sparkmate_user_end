require 'rails_helper'

RSpec.describe "chats#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/chats/#{chat.id}"
  end

  describe 'basic destroy' do
    let!(:chat) { create(:chat) }

    it 'updates the resource' do
      expect(ChatResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { Chat.count }.by(-1)
      expect { chat.reload }
        .to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq('meta' => {})
    end
  end
end
