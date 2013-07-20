require 'spec_helper'

describe Comment do
  context "when given the correct parameters" do
    def create_comment
      Comment.create(message: "This is a comment.")
    end

    it "creates a comment" do
      result = create_comment

      expect(result).not_to be_nil
      expect(result).to be_valid
      expect(result.class).to eq Comment
      expect(result.message).to eq "This is a comment."
    end

    it "creates a comment with a user" do
      comment = create_comment
      user    = User.create(name: "Ana Smith")
      comment.user = user
      result  = comment.user

      expect(result).not_to be_nil
      expect(result).to eq user
    end
  end
end