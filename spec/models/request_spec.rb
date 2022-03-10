require 'rails_helper'

RSpec.describe Request, type: :model do
  
    describe "Direct Associations" do

    it { should have_many(:add_on_services) }

    it { should belong_to(:user) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do

    end
end
