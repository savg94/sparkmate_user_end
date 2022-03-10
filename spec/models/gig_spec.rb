require "rails_helper"

RSpec.describe Gig, type: :model do
  describe "Direct Associations" do
    it { should have_many(:chats) }

    it { should belong_to(:provider) }

    it { should belong_to(:request) }
  end

  describe "InDirect Associations" do
  end

  describe "Validations" do
    it { should validate_presence_of(:provider_id) }

    it { should validate_presence_of(:request_id) }

    it { should validate_presence_of(:status) }
  end
end
