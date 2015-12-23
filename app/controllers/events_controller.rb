class EventsController < ApplicationController
  def index
    @search = params[:search].strip # Remove all leading and trailing whitespace

    if @search.empty?
      @events = Event.all
    else
      @events = Event.where('name LIKE ? OR extended_html_description LIKE ?', "%#{@search}%", "%#{@search}%").all
    end
  end

  def show
    @event = Event.find(params[:id])
  end
end
