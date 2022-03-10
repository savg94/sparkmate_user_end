require "rails_helper"

RSpec.describe ProviderResource, type: :resource do
  describe "creating" do
    let(:payload) do
      {
        data: {
          type: "providers",
          attributes: {},
        },
      }
    end

    let(:instance) do
      ProviderResource.build(payload)
    end

    it "works" do
      expect do
        expect(instance.save).to eq(true),
                                 instance.errors.full_messages.to_sentence
      end.to change { Provider.count }.by(1)
    end
  end

  describe "updating" do
    let!(:provider) { create(:provider) }

    let(:payload) do
      {
        data: {
          id: provider.id.to_s,
          type: "providers",
          attributes: {}, # Todo!
        },
      }
    end

    let(:instance) do
      ProviderResource.find(payload)
    end

    xit "works (add some attributes and enable this spec)" do
      expect do
        expect(instance.update_attributes).to eq(true)
      end.to change { provider.reload.updated_at }
      # .and change { provider.foo }.to('bar') <- example
    end
  end

  describe "destroying" do
    let!(:provider) { create(:provider) }

    let(:instance) do
      ProviderResource.find(id: provider.id)
    end

    it "works" do
      expect do
        expect(instance.destroy).to eq(true)
      end.to change { Provider.count }.by(-1)
    end
  end
end
