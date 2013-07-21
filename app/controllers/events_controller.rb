class EventsController < ApplicationController
  def index
    @events = Event.all.asc(:created_at)
  end

  def index_by_hour
    @event_collections = Event.by_hour
  end
end