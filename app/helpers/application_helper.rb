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

  private

  def build_enter(event)
    "#{format_time(event.created_at)}: #{event.users.first.name} enters the room.".html_safe
  end

  def build_leaves(event)
    "#{format_time(event.created_at)}: #{event.users.first.name} leaves.".html_safe
  end

  def build_comment(event)
    "#{format_time(event.created_at)}: #{event.users.first.name} comments: #{event.comment.message}".html_safe
  end

  def build_high_five(event)
    "#{format_time(event.created_at)}: #{event.users.first.name} high-fives #{event.users.last.name}".html_safe
  end
end