require 'rails_helper'

RSpec.describe Category, type: :model do
  describe "validations" do
    context "invalid attibutes" do
      it "is invalid without a title" do
        category = build(:category, title: nil)
        expect(category).to be_invalid
      end

      it "is invalid without a unique title" do
        create(:category, title: "Yo")
        category = build(:category, title: "Yo")
        expect(category).to be_invalid
      end
    end

    context "valid attributes" do
      it "is valid with a title" do
        category = build(:category)
        expect(category).to be_valid
      end
    end
  end
end
