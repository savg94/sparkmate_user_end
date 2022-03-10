require "rails_helper"

RSpec.describe AddOnServiceResource, type: :resource do
  describe "serialization" do
    let!(:add_on_service) { create(:add_on_service) }

    it "works" do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(add_on_service.id)
      expect(data.jsonapi_type).to eq("add_on_services")
    end
  end

  describe "filtering" do
    let!(:add_on_service1) { create(:add_on_service) }
    let!(:add_on_service2) { create(:add_on_service) }

    context "by id" do
      before do
        params[:filter] = { id: { eq: add_on_service2.id } }
      end

      it "works" do
        render
        expect(d.map(&:id)).to eq([add_on_service2.id])
      end
    end
  end

  describe "sorting" do
    describe "by id" do
      let!(:add_on_service1) { create(:add_on_service) }
      let!(:add_on_service2) { create(:add_on_service) }

      context "when ascending" do
        before do
          params[:sort] = "id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      add_on_service1.id,
                                      add_on_service2.id,
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
                                      add_on_service2.id,
                                      add_on_service1.id,
                                    ])
        end
      end
    end
  end

  describe "sideloading" do
    # ... your tests ...
  end
end
