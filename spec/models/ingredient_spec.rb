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

  end

end