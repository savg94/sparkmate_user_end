require "rails_helper"

RSpec.describe AddOnServiceResource, type: :resource do
  describe "creating" do
    let(:payload) do
      {
        data: {
          type: "add_on_services",
          attributes: {},
        },
      }
    end

    let(:instance) do
      AddOnServiceResource.build(payload)
    end

    it "works" do
      expect do
        expect(instance.save).to eq(true),
                                 instance.errors.full_messages.to_sentence
      end.to change { AddOnService.count }.by(1)
    end
  end

  describe "updating" do
    let!(:add_on_service) { create(:add_on_service) }

    let(:payload) do
      {
        data: {
          id: add_on_service.id.to_s,
          type: "add_on_services",
          attributes: {}, # Todo!
        },
      }
    end

    let(:instance) do
      AddOnServiceResource.find(payload)
    end

    xit "works (add some attributes and enable this spec)" do
      expect do
        expect(instance.update_attributes).to eq(true)
      end.to change { add_on_service.reload.updated_at }
      # .and change { add_on_service.foo }.to('bar') <- example
    end
  end

  describe "destroying" do
    let!(:add_on_service) { create(:add_on_service) }

    let(:instance) do
      AddOnServiceResource.find(id: add_on_service.id)
    end

    it "works" do
      expect do
        expect(instance.destroy).to eq(true)
      end.to change { AddOnService.count }.by(-1)
    end
  end
end
