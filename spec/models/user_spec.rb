require "rails_helper"

RSpec.describe User, type: :model do
  describe "Direct Associations" do
    it { should have_many(:requests) }

    it { should have_many(:chats) }
  end

  describe "InDirect Associations" do
    it { should have_many(:providers) }
  end

  describe "Validations" do
    it { should validate_presence_of(:last_name) }

    it { should validate_presence_of(:name) }
  end
end
