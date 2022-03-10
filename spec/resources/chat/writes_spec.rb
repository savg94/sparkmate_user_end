require "rails_helper"

RSpec.describe ChatResource, type: :resource do
  describe "creating" do
    let(:payload) do
      {
        data: {
          type: "chats",
          attributes: {},
        },
      }
    end

    let(:instance) do
      ChatResource.build(payload)
    end

    it "works" do
      expect do
        expect(instance.save).to eq(true),
                                 instance.errors.full_messages.to_sentence
      end.to change { Chat.count }.by(1)
    end
  end

  describe "updating" do
    let!(:chat) { create(:chat) }

    let(:payload) do
      {
        data: {
          id: chat.id.to_s,
          type: "chats",
          attributes: {}, # Todo!
        },
      }
    end

    let(:instance) do
      ChatResource.find(payload)
    end

    xit "works (add some attributes and enable this spec)" do
      expect do
        expect(instance.update_attributes).to eq(true)
      end.to change { chat.reload.updated_at }
      # .and change { chat.foo }.to('bar') <- example
    end
  end

  describe "destroying" do
    let!(:chat) { create(:chat) }

    let(:instance) do
      ChatResource.find(id: chat.id)
    end

    it "works" do
      expect do
        expect(instance.destroy).to eq(true)
      end.to change { Chat.count }.by(-1)
    end
  end
end
