class EventsController < ApplicationController
  
  def index
    @events = Event.where(published:true).order('created_at DESC')
  end

  def show
    @event = Event.find(params[:id])
  end

end