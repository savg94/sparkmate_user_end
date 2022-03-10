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
  end
end
