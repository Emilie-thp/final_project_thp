module Dashboard

	class EventsController < ApplicationController
		layout 'application', :only => :show
		layout 'dashboard', :except => :show
		before_action :authenticate_admin!
		before_action :secret, only: [:edit, :update, :destroy]

		def index
			@events = Event.all
			@current_events = Event.where(admin_id: current_admin.id)
		end

	  def new
	    @event = Event.new
	  end


	  def create
			@event = Event.new(event_params)
			@event.admin = current_admin

			if @event.save
	    	flash[:notice] = "Une nouvelle actualité a bien été créée (n°#{@event.id})!"
				redirect_to dashboard_events_path
		 	else
				render "new"
		 	end
	  end

	  def show
	    @event = Event.find(params[:id])
	  end

	  def edit
	    @event = Event.find(params[:id])
	  end

	  def update
	    @event = Event.find(params[:id])
	    if @event.update(event_params)
	    	flash[:notice] = "L'actualité n°#{@event.id} a bien été éditée !"
				redirect_to dashboard_events_path
			else
				render "edit"
	  	end
	  end


	  def destroy
	    @event = Event.find(params[:id])
	    @event.destroy
    	flash[:notice] = "L'actualité n°#{@event.id} a bien été supprimée !"
    	redirect_to dashboard_events_path
	  end



		private

	  def event_params
	    params.require(:event).permit(:title, :description, :content, :date, :published, :location)
	  end

		def secret
			@event = Event.find(params[:id])
			@admin = Admin.find(@event.admin_id)
				unless @admin.id == current_admin.id
					flash[:notice] = "Vous n'avez pas le droit d'éditer l'actualité car vous n'êtes pas l'auteur !"
					redirect_to dashboard_events_path
		end

	end
	end

end
