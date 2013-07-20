require 'spec_helper'

describe User do
  context "When given the correct parameters" do
    it "creates a user" do
      result = User.create(name: "Jorge")

      expect(result).not_to be_nil
      expect(result).to be_valid
      expect(result.class).to be User
      expect(result.name).to eq "Jorge"
    end
  end
end