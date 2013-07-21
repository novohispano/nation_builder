module ApplicationHelper
  def format_time(input)
    input.localtime.strftime("%B %d, %Y - %l:%M %p")
  end

  def build_event(event)
    case event.type
    when "enter-the-room"         then build_enter(event)
    when "leave-the-room"         then build_leaves(event)
    when "comment"                then build_comment(event)
    when "high-five-another-user" then build_high_five(event)
    end
  end

  def build_events_by_type(event_type, events)
    case event_type
    when "enter-the-room"         then build_by_type_enter(events)
    when "leave-the-room"         then build_by_type_leaves(events)
    when "comment"                then build_by_type_comment(events)
    when "high-five-another-user" then build_by_type_high_five(events)
    end
  end

  def group_events_by_type(events)
    events.group_by{ |event| event.type }
  end

  private

  def build_enter(event)
    "#{format_time(event.created_at)}: #{event.users.first.name} enters the room."
  end

  def build_leaves(event)
    "#{format_time(event.created_at)}: #{event.users.first.name} leaves."
  end

  def build_comment(event)
    "#{format_time(event.created_at)}: #{event.users.first.name} comments: #{event.comment.message}"
  end

  def build_high_five(event)
    "#{format_time(event.created_at)}: #{event.users.first.name} high-fives #{event.users.last.name}"
  end

  def build_by_type_enter(events)
    "#{events.count} #{pluralize_people(events.count)} entered."
  end

  def build_by_type_leaves(events)
    "#{events.count} #{pluralize_people(events.count)} left."
  end

  def build_by_type_comment(events)
    "#{events.count} #{pluralize_comments(events.count)}."
  end

  def build_by_type_high_five(events)
    "#{events.count} #{pluralize_people(events.count)} high-fived #{events.count} other #{pluralize_people(events.count)}."
  end

  def pluralize_people(i)
    i > 1 ? "people" : "person"
  end

  def pluralize_comments(i)
    i > 1 ? "comments" : "comment"
  end
end