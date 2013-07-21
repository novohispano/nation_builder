require 'spec_helper'

describe Event do
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

    expect(result).not_to be_nil
    expect(result).to eq user
  end

  it "creates an event with a comment" do
    event         = create_event
    comment       = Comment.create(message: "This is a comment.")
    event.comment = comment
    result        = event.comment

    expect(result).not_to be_nil
    expect(result).to eq comment
  end

  it "groups the events by hour" do
    Event.create(
      created_at: Time.parse("2013-07-20 23:50:20 MST")
      )
    Event.create(
      created_at: Time.parse("2013-07-20 21:46:16 MST")
      )
    Event.create(
      created_at: Time.parse("2013-07-20 21:20:10 MST")
      )

    result = Event.by_hour
    expect(result.keys).to eq ["July 20, 2013 - 10 PM", "July 21, 2013 - 12 AM"]
    expect(result["July 20, 2013 - 10 PM"].size).to eq 2
    expect(result["July 21, 2013 - 12 AM"].size).to eq 1
  end
end