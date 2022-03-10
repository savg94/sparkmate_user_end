require "rails_helper"

RSpec.describe ChatResource, type: :resource do
  describe "serialization" do
    let!(:chat) { create(:chat) }

    it "works" do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(chat.id)
      expect(data.jsonapi_type).to eq("chats")
    end
  end

  describe "filtering" do
    let!(:chat1) { create(:chat) }
    let!(:chat2) { create(:chat) }

    context "by id" do
      before do
        params[:filter] = { id: { eq: chat2.id } }
      end

      it "works" do
        render
        expect(d.map(&:id)).to eq([chat2.id])
      end
    end
  end

  describe "sorting" do
    describe "by id" do
      let!(:chat1) { create(:chat) }
      let!(:chat2) { create(:chat) }

      context "when ascending" do
        before do
          params[:sort] = "id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      chat1.id,
                                      chat2.id,
                                    ])
        end
      end

      context "when descending" do
        before do
          params[:sort] = "-id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      chat2.id,
                                      chat1.id,
                                    ])
        end
      end
    end
  end

  describe "sideloading" do
    # ... your tests ...
  end
end
