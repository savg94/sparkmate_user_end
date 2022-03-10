require "rails_helper"

RSpec.describe RequestResource, type: :resource do
  describe "creating" do
    let(:payload) do
      {
        data: {
          type: "requests",
          attributes: {},
        },
      }
    end

    let(:instance) do
      RequestResource.build(payload)
    end

    it "works" do
      expect do
        expect(instance.save).to eq(true),
                                 instance.errors.full_messages.to_sentence
      end.to change { Request.count }.by(1)
    end
  end

  describe "updating" do
    let!(:request) { create(:request) }

    let(:payload) do
      {
        data: {
          id: request.id.to_s,
          type: "requests",
          attributes: {}, # Todo!
        },
      }
    end

    let(:instance) do
      RequestResource.find(payload)
    end

    xit "works (add some attributes and enable this spec)" do
      expect do
        expect(instance.update_attributes).to eq(true)
      end.to change { request.reload.updated_at }
      # .and change { request.foo }.to('bar') <- example
    end
  end

  describe "destroying" do
    let!(:request) { create(:request) }

    let(:instance) do
      RequestResource.find(id: request.id)
    end

    it "works" do
      expect do
        expect(instance.destroy).to eq(true)
      end.to change { Request.count }.by(-1)
    end
  end
end
