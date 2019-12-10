module Dashboard

	class EventsController < ApplicationController
		layout 'application', :only => :show
		layout 'dashboard', :except => :show
		before_action :authenticate_admin!
		before_action :secret, only: [:edit, :update, :destroy]


		def index
			@events = Event.all
		end

	  def new
	    @event = Event.new
	  end

	  def create
		
	  end

	  def show
			@event = Event.find(params[:id])
	  end

	  def edit
	    
	  end

	  def update
	   
	   
	  end

	  def destroy
	   
	  end

		def secret
		
	end

	  private

	  def event_params
	    params.require(:event).permit(:title, :description, :content, :date, :published)
	  end

	end

end
