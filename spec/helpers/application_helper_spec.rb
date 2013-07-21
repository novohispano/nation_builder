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

    it "builds a enter-the-room grouped event" do
      event_1 = create_event("enter-the-room")
      event_2 = create_event("enter-the-room")
      events  = []
      events.push(event_1, event_2)
      result  = build_events_by_type("enter-the-room", events)

      expect(result).to eq "2 people entered."
    end

    it "builds a leave-the-room grouped event" do
      event_1 = create_event("leave-the-room")
      event_2 = create_event("leave-the-room")
      events  = []
      events.push(event_1, event_2)
      result  = build_events_by_type("leave-the-room", events)

      expect(result).to eq "2 people left."
    end

    it "builds a leave-the-room grouped event" do
      event_1 = create_event("comment")
      event_2 = create_event("comment")
      events  = []
      events.push(event_1, event_2)
      result  = build_events_by_type("comment", events)

      expect(result).to eq "2 comments."
    end

    it "builds a high-five-another-user grouped event" do
      event_1 = create_event("high-five-another-user")
      event_2 = create_event("high-five-another-user")
      events  = []
      events.push(event_1, event_2)
      result  = build_events_by_type("high-five-another-user", events)

      expect(result).to eq "2 people high-fived 2 other people."
    end

    it "groups events by type" do
      event_1 = create_event("high-five-another-user")
      event_2 = create_event("high-five-another-user")
      event_3 = create_event("comment")
      events  = []
      events.push(event_1, event_2, event_3)
      result  = group_events_by_type(events)

      expect(result.keys).to eq ["high-five-another-user", "comment"]
      expect(result["high-five-another-user"].count).to eq 2
      expect(result["comment"].count).to eq 1
    end
  end
end