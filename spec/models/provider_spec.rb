require 'rails_helper'

RSpec.describe Provider, type: :model do
  
    describe "Direct Associations" do

    it { should have_many(:chats) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do

    end
end
