require "rails_helper"

RSpec.describe GigResource, type: :resource do
  describe "serialization" do
    let!(:gig) { create(:gig) }

    it "works" do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(gig.id)
      expect(data.jsonapi_type).to eq("gigs")
    end
  end

  describe "filtering" do
    let!(:gig1) { create(:gig) }
    let!(:gig2) { create(:gig) }

    context "by id" do
      before do
        params[:filter] = { id: { eq: gig2.id } }
      end

      it "works" do
        render
        expect(d.map(&:id)).to eq([gig2.id])
      end
    end
  end

  describe "sorting" do
    describe "by id" do
      let!(:gig1) { create(:gig) }
      let!(:gig2) { create(:gig) }

      context "when ascending" do
        before do
          params[:sort] = "id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      gig1.id,
                                      gig2.id,
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
                                      gig2.id,
                                      gig1.id,
                                    ])
        end
      end
    end
  end

  describe "sideloading" do
    # ... your tests ...
  end
end
