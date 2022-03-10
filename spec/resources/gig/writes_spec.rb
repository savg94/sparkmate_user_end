require 'rails_helper'

RSpec.describe GigResource, type: :resource do
  describe 'creating' do
    let(:payload) do
      {
        data: {
          type: 'gigs',
          attributes: { }
        }
      }
    end

    let(:instance) do
      GigResource.build(payload)
    end

    it 'works' do
      expect {
        expect(instance.save).to eq(true), instance.errors.full_messages.to_sentence
      }.to change { Gig.count }.by(1)
    end
  end

  describe 'updating' do
    let!(:gig) { create(:gig) }

    let(:payload) do
      {
        data: {
          id: gig.id.to_s,
          type: 'gigs',
          attributes: { } # Todo!
        }
      }
    end

    let(:instance) do
      GigResource.find(payload)
    end

    xit 'works (add some attributes and enable this spec)' do
      expect {
        expect(instance.update_attributes).to eq(true)
      }.to change { gig.reload.updated_at }
      # .and change { gig.foo }.to('bar') <- example
    end
  end

  describe 'destroying' do
    let!(:gig) { create(:gig) }

    let(:instance) do
      GigResource.find(id: gig.id)
    end

    it 'works' do
      expect {
        expect(instance.destroy).to eq(true)
      }.to change { Gig.count }.by(-1)
    end
  end
end
