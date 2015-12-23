class EventsController < ApplicationController
  def index
    @search = params[:search].strip # Remove all leading and trailing whitespace

    if @search.empty?
      @events = Event.upcoming
    else
      @events = Event.upcoming.where('name LIKE ? OR extended_html_description LIKE ?', "%#{@search}%", "%#{@search}%").all
    end
  end

  def show
    @event = Event.find(params[:id])
  end
end
