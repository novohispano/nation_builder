require 'spec_helper'

describe ApplicationHelper do
  context "#format_time" do
    it "formats a DateTime object properly" do
      time   = Time.parse("2013-07-20 18:32:51 UTC")
      result = format_time(time)

      expect(result).to eq "July 20, 2013 - 12:32 PM"
    end
  end

  context "#build_event" do
    def create_event(type)
      event      = Event.create(
        type: type,
        created_at: Time.parse("2013-07-20 18:32:51 UTC")
        )
      user_1     = User.create(name: "Ana")
      user_2     = User.create(name: "Jorge")
      event.users.push(user_1, user_2)
      event
    end

    it "builds an enter event" do
      event  = create_event("enter-the-room")
      result = build_event(event)

      expect(result).to eq "July 20, 2013 - 12:32 PM: Ana enters the room."
    end

    it "builds a leaves event" do
      event  = create_event("leave-the-room")
      result = build_event(event)

      expect(result).to eq "July 20, 2013 - 12:32 PM: Ana leaves."
    end

    it "builds a comment event" do
      event         = create_event("comment")
      event.comment = Comment.create(message: "This is a comment.")
      result        = build_event(event)

      expect(result).to eq "July 20, 2013 - 12:32 PM: Ana comments: This is a comment."
    end

    it "buids a high-five event" do
      event  = create_event("high-five-another-user")
      result = build_event(event)

      expect(result).to eq "July 20, 2013 - 12:32 PM: Ana high-fives Jorge"
    end
  end
end