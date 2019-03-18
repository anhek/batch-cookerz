require 'rails_helper'

RSpec.describe Ingredient, type: :model do

  before(:each) do 
    @ingredient = FactoryBot.create(:ingredient)
  end

  it "has a valid factory" do
    expect(build(:ingredient)).to be_valid
  end

  context "validation" do

    it "is valid with valid attributes" do
      expect(@ingredient).to be_a(Ingredient)
      expect(@ingredient).not_to be_nil
    end

    describe "#name" do 
      it { expect(@ingredient).to validate_presence_of(:name) }
      it { expect(@ingredient.name).to be_a(String) }
      it { expect(@ingredient).to validate_length_of(:name).is_at_least(3) }
    end

    describe "#calories" do
      it { expect(@ingredient.calories).to be_a(Numeric) }
      it { expect(@ingredient).to validate_presence_of(:calories) }
    end

    # describe "#email" do
    #   it { expect(@user).to validate_presence_of(:email) }
    #   it { expect(@user).not_to allow_value("blah").for(:email) }
    #   it { expect(@user).to allow_value("a@b.com").for(:email) }
    #   it { expect(@user).not_to be_nil }
    # end

    # describe "#password" do
    #   it { should validate_presence_of(:password) }
    #   it { expect(@user).not_to allow_value("123456").for(:email) }
    #   it { should validate_length_of(:password).is_at_least(6) }
    # end

  end

  # context "associations" do

  #   describe "books" do
  #     it { expect(@user).to have_many(:books) }
  #   end

  # end

  # context "public instance methods" do

  #   describe "#full_name" do

  #     it "should return a string" do
  #       expect(@user.full_name).to be_a(String)
  #     end

  #     it "should return the full name" do
  #       expect(@user.full_name).to eq("John Doe")
  #       user_2 = create(:user, first_name: "Jean-Michel", last_name: "Durant")
  #       expect(user_2.full_name).to eq("Jean-Michel Durant")
  #     end
  #   end

  # end

end