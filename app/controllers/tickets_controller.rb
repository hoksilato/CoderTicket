class TicketsController < ApplicationController
  def new
    @event = Event.find(params[:event_id])
    redirect_to root_path, flash: {alert: "Sorry, this event started, you should view another one!"} if @event.starts_at <= DateTime.now
  end
end
