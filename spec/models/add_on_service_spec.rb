require "rails_helper"

RSpec.describe AddOnService, type: :model do
  describe "Direct Associations" do
    it { should belong_to(:request) }
  end

  describe "InDirect Associations" do
  end

  describe "Validations" do
  end
end
