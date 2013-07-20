require 'spec_helper'

describe Event do
  context "When given the correct parameters" do
    def create_event(type = "enter-the-room")
      Event.create(
        type: type
        )
    end

    it "creates an event" do
      result = create_event

      expect(result).not_to be_nil
      expect(result).to be_valid
      expect(result.class).to be Event
      expect(result.type).to eq "enter-the-room"
    end

    it "creates an event with a user" do
      user   = User.create(name: "Jorge")
      event  = create_event
      event.users << user
      result = event.users.first

      expect(result).to eq user
    end
  end
end