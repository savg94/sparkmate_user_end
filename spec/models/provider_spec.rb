require 'rails_helper'

RSpec.describe Provider, type: :model do
  
    describe "Direct Associations" do

    it { should have_many(:active_gigs) }

    it { should have_many(:chats) }

    end

    describe "InDirect Associations" do

    it { should have_many(:requests) }

    it { should have_many(:users) }

    end

    describe "Validations" do

    end
end
