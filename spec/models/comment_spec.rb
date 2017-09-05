require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe "validations" do
    context "invalid attributes" do
      it "is invalid without content" do
        job = create(:job)
        comment = job.comments.new()
        expect(comment).to be_invalid
      end
    end

    context "valid attributes" do
      it "is valid with content" do
        job = create(:job)
        comment = job.comments.new(content: "Hello There")
        expect(comment).to be_valid
      end
    end
  end

  describe "relationships" do
    it "belongs to job" do
      comment = Comment.new(content: "Yo")
      expect(comment).to respond_to(:job)
    end
  end
end
