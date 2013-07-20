require 'spec_helper'

describe Event do
  context "When given the correct parameters" do
    it "creates an event" do
      result = Event.create(action: "enters")

      expect(result).not_to be_nil
      expect(result).to be_valid
      expect(result.class).to be Event
      expect(result.action).to eq "enters"
    end

    it "creates an event with a user" do
      user   = User.create(name: "Jorge")
      event  = Event.create(action: "enters")
      event.users << user
      result = event.users.first

      expect(result).to eq user
    end
  end
end