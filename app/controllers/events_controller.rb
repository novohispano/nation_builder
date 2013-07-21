class EventsController < ApplicationController
  def index
    @events = Event.all.asc(:created_at)
  end

  def index_by_hour
    @events = Event.all.asc(:created_at).group_by do |event|
      event.created_at.localtime.strftime("%B %d, %Y - %l %p")
    end
  end
end