require 'rails_helper'

RSpec.describe Recipe, type: :model do

  before(:each) do 
    @recipe = FactoryBot.create(:recipe)
  end

  it "has a valid factory" do
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
      it { expect(@recipe).to allow_value("40").for(:preparation_time) }
      it { expect(@recipe).not_to allow_value(String).for(:preparation_time) }
      it { expect(@recipe).not_to be_nil }
    end

    describe "#cooking_time" do 
      it { expect(@recipe).to validate_presence_of(:cooking_time) }
    end
    
    describe "#price_indicator" do 
      it { expect(@recipe).to validate_presence_of(:price_indicator) }
    end

    describe "#recipe_category_id" do 
      it { should validate_presence_of(:recipe_category_id) }
    end

  end

end