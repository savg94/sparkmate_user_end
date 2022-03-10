require "rails_helper"

RSpec.describe RequestResource, type: :resource do
  describe "serialization" do
    let!(:request) { create(:request) }

    it "works" do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(request.id)
      expect(data.jsonapi_type).to eq("requests")
    end
  end

  describe "filtering" do
    let!(:request1) { create(:request) }
    let!(:request2) { create(:request) }

    context "by id" do
      before do
        params[:filter] = { id: { eq: request2.id } }
      end

      it "works" do
        render
        expect(d.map(&:id)).to eq([request2.id])
      end
    end
  end

  describe "sorting" do
    describe "by id" do
      let!(:request1) { create(:request) }
      let!(:request2) { create(:request) }

      context "when ascending" do
        before do
          params[:sort] = "id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      request1.id,
                                      request2.id,
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
                                      request2.id,
                                      request1.id,
                                    ])
        end
      end
    end
  end

  describe "sideloading" do
    # ... your tests ...
  end
end
