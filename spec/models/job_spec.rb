require 'rails_helper'

describe Job do
  describe "validations" do
    context "invalid attributes" do
      it "is invalid without a title" do
        category = build(:category)
        company = build(:company)
        job = Job.new(level_of_interest: 80, description: "Wahoo", city: "Denver", company: company, category: category)
        expect(job).to be_invalid
      end

      it "is invalid without a level of interest" do
        category = build(:category)
        company = build(:company)
        job = Job.new(title: "Developer", description: "Wahoo", city: "Denver", company: company, category: category)
        expect(job).to be_invalid
      end

      it "is invalid without a city" do
        category = build(:category)
        company = build(:company)
        job = Job.new(title: "Developer", description: "Wahoo", level_of_interest: 80, company: company, category: category)
        expect(job).to be_invalid
      end

      it "is invalid without a company" do
        category = build(:category)
        job = Job.new(title: "Developer", description: "Wahoo", city: "Denver", category: category)
        expect(job).to be_invalid
      end

      it "is invalid without a category" do
        company = build(:company)
        job = Job.new(title: "Developer", description: "Wahoo", city: "Denver", company: company)
        expect(job).to be_invalid
      end
    end

    context "valid attributes" do
      it "is valid with a title, level of interest, company, and category" do
        company = Company.new(name: "Turing")
        category = Category.new(title: "Education")
        job = Job.new(title: "Developer", level_of_interest: 40, city: "Denver", company: company, category: category)
        expect(job).to be_valid
      end
    end
  end

  describe "relationships" do
    it "belongs to a company" do
      job = Job.new(title: "Software", level_of_interest: 70, description: "Wahooo")
      expect(job).to respond_to(:company)
    end

    it "belongs to a category" do
      job = build(:job)
      expect(job).to respond_to(:category)
    end
  end
end
