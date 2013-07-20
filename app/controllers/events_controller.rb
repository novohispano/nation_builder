class EventsController < ApplicationController
  def index
    @events = Event.all.desc(:created_at)
  end
end