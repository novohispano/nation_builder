class EventsController < ApplicationController
  def index
    @events = Event.all.asc(:created_at)
  end
end