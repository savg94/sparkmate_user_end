require "rails_helper"

RSpec.describe Request, type: :model do
  describe "Direct Associations" do
    it { should have_many(:active_gigs) }

    it { should have_many(:add_on_services) }

    it { should belong_to(:user) }
  end

  describe "InDirect Associations" do
    it { should have_many(:providers) }
  end

  describe "Validations" do
    it { should validate_presence_of(:pickup_datetime) }

    it { should validate_presence_of(:pickup_location) }

    it { should validate_presence_of(:user_id) }
  end
end
