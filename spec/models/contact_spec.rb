require 'rails_helper'

RSpec.describe Contact, type: :model do
  describe "validations" do
    context "invalid attributes" do
      it "is invalid without full_name" do
        company = create(:company)
        contact = company.contacts.new(position: "Controller", email: "a@a.com")
        expect(contact).to be_invalid
      end

      it "is invalid without position" do
        company = create(:company)
        contact = company.contacts.new(full_name: "Sam", email: "a@a.com")
        expect(contact).to be_invalid
      end

      it "is invalid without email" do
        company = create(:company)
        contact = company.contacts.new(full_name: "Sam", position: "controller")
        expect(contact).to be_invalid
      end
    end

    context "valid attributes" do
      it "is valid with full_name, position, email" do
        company = create(:company)
        contact = company.contacts.new(full_name: "Sam", position: "Controller", email: "a@a.com")
        expect(contact).to be_valid
      end
    end
  end

  describe "relationships" do
    it "belongs to company" do
      contact = Contact.new(full_name: "Sam", position: "Controller", email: "a@a.com")
      expect(contact).to respond_to(:company)
    end
  end
end
