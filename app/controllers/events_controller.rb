class EventsController < ApplicationController
  def index
    @search = params[:search] ? params[:search].strip : '' # Remove all leading and trailing whitespace

    if @search.empty?
      @events = Event.upcoming
    else
      @events = Event.upcoming.search(@search)
    end
  end

  def show
    @event = Event.find(params[:id])
  end
end
