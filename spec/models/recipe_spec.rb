require 'rails_helper'

RSpec.describe Recipe, type: :model do

  before(:each) do 
    @recipe = FactoryBot.create(:recipe)
  end

  it "has a valid factory" do
    # teste toujours tes factories pour voir si elles sont valides
    expect(build(:recipe)).to be_valid
  end

  context "validation" do

    it "is valid with valid attributes" do
      expect(@recipe).to be_a(Recipe)
      expect(@recipe).not_to be_nil
    end

    describe "#name" do 
      it { expect(@recipe).to validate_presence_of(:name) }
      
    end

    describe "#description" do 
      it { expect(@recipe).to validate_presence_of(:description) }
      it { expect(@recipe).not_to be_nil }
    end

    describe "#preparation_time" do 
      it { expect(@recipe).to validate_presence_of(:preparation_time) }
      it { expect(@recipe).not_to allow_value("2").for(:preapration_time) }
      it { expect(@recipe).to allow_value("40").for(:preapration_time) }
      it { expect(@recipe).not_to be_nil }
    end

    describe "#cooking_time" do 
      it { expect(@recipe).to validate_presence_of(:cooking_time) }
    end
    
    describe "#cost" do 
      it { expect(@recipe).to validate_presence_of(:cost) }
    end

    describe "#recipe_category_id" do 
      it { should validate_presence_of(:recipe_category_id) }
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

    # describe "#first_name" do
    #   it { expect(@user).to validate_presence_of(:first_name) }
    # end

    # describe "#last_name" do
    #   it { expect(@user).to validate_presence_of(:last_name) }
    # end

    # describe "#username" do
    #   it { expect(@user).to validate_length_of(:username).is_at_least(3) }
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