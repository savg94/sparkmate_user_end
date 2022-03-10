require "rails_helper"

RSpec.describe Chat, type: :model do
  describe "Direct Associations" do
    it { should belong_to(:gig) }

    it { should belong_to(:provider) }

    it { should belong_to(:user) }
  end

  describe "InDirect Associations" do
  end

  describe "Validations" do
    it { should validate_presence_of(:gig_id) }

    it { should validate_presence_of(:message) }

    it { should validate_presence_of(:provider_id) }

    it { should validate_presence_of(:user_id) }
  end
end
