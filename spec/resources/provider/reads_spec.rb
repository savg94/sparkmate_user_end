require 'rails_helper'

RSpec.describe ProviderResource, type: :resource do
  describe 'serialization' do
    let!(:provider) { create(:provider) }

    it 'works' do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(provider.id)
      expect(data.jsonapi_type).to eq('providers')
    end
  end

  describe 'filtering' do
    let!(:provider1) { create(:provider) }
    let!(:provider2) { create(:provider) }

    context 'by id' do
      before do
        params[:filter] = { id: { eq: provider2.id } }
      end

      it 'works' do
        render
        expect(d.map(&:id)).to eq([provider2.id])
      end
    end
  end

  describe 'sorting' do
    describe 'by id' do
      let!(:provider1) { create(:provider) }
      let!(:provider2) { create(:provider) }

      context 'when ascending' do
        before do
          params[:sort] = 'id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            provider1.id,
            provider2.id
          ])
        end
      end

      context 'when descending' do
        before do
          params[:sort] = '-id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            provider2.id,
            provider1.id
          ])
        end
      end
    end
  end

  describe 'sideloading' do
    # ... your tests ...
  end
end
