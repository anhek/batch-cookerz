require 'rails_helper'

RSpec.describe User, type: :model do

  before(:each) do 
    @user = FactoryBot.create(:user)
  end

  it "has a valid factory" do
    expect(build(:user)).to be_valid
  end

  context "validation" do

    it "is valid with valid attributes" do
      expect(@user).to be_a(User)
      expect(@user).not_to be_nil
    end

    describe "#email" do
      it { should validate_presence_of(:email) }
      it { expect(@user).not_to allow_value("blah").for(:email) }
      it { expect(@user).to allow_value("a@b.com").for(:email) }
    end

    describe "#password" do
      it { should validate_presence_of(:password) }
      it { expect(@user).not_to allow_value("123456").for(:email) }
      it { should validate_length_of(:password).is_at_least(6) }
    end

    describe "#first_name" do
      it { expect(@user.first_name).to be_a(String) }
    end

    describe "#last_name" do
      it { expect(@user.last_name).to be_a(String) }
    end

  end
end