module Dashboard

	class EventsController < ApplicationController
		layout 'dashboard'
		before_action :authenticate_admin!
		before_action :secret, only: [:edit, :update, :destroy]


		def index
			@events = Event.all
		end

	  def new
	    @event = Event.new
	  end

	  def create
			@event = Event.new(event_params)
			@event.admin = current_admin
			if @event.save
	    	flash[:notice] = "Une nouvelle activité a bien été créée (n°#{@event.id})!"
				redirect_to edit_dashboard_event_path(@event)
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
	    	flash[:notice] = "L'activité n°#{@event.id} a bien été éditée !"
				redirect_to dashboard_events_path
			else
				render "edit"
	  	end
	  end

	  def destroy
	    @event = Event.find(params[:id])
	    @event.destroy
    	flash[:notice] = "L'activité n°#{@event.id} a bien été supprimée !"
    	redirect_to dashboard_events_path
	  end

		def secret
			@event = Event.find(params[:id])
			@admin = Admin.find(@event.admin_id)
				unless @admin.id == current_admin.id
					flash[:notice] = "Vous n'avez pas le droit d'éditer le event car vous n'êtes pas l'auteur !"
					redirect_to dashboard_events_path
		end
	end

	  private

	  def event_params
	    params.require(:event).permit(:title, :description, :content, :date, :published)
	  end

	end

end
