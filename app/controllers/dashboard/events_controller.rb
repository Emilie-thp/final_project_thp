module Dashboard

  class EventsController < ApplicationController
    before_action :authenticate_admin!
    before_action :secret, only: [:edit, :update, :destroy]

    def index
      @events = Event.all
      @current_events = Event.where(admin_id: current_admin.id).order('created_at DESC')
    end

    def new
      @event = Event.new
    end

    def create
      @event = Event.new(event_params)
      @event.admin = current_admin
      if @event.save
        flash[:notice] = "Vous venez de créer une nouvelle actualité. Vérifiez les informations avant de la mettre en ligne !"
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
        flash[:notice] = "L'actualité '#{@event.title}'' a bien été éditée !"
        redirect_to dashboard_events_path
      else
        render "edit"
      end
    end

    #another update method to update only the published column (bolean)
    def update_published
      @event = Event.find(params[:id])
			#reverse the published attribute, false become true (online) and true become false (offline)
      if @event.published
        @event.update(published: false)
        redirect_to edit_dashboard_event_path(@event)
        flash[:notice] = "Votre actualité vient d'être mise hors ligne !"
      else
        @event.update(published: true)
        flash[:notice] = "Votre actualité vient d'être mise en ligne !"
        redirect_to edit_dashboard_event_path(@event)
      end
    end

    def destroy
      @event = Event.find(params[:id])
      @event.destroy
      respond_to do |format|
        format.html do
          flash[:notice] = "L'actualité '#{@event.title}'' a bien été supprimée !"
          redirect_to dashboard_events_path
        end
        format.js do
        end
      end
    end


    private

    def event_params
      params.require(:event).permit(:title, :description, :content, :date, :published, :location)
    end

    #method to prevent one admin to edit or destroy another admin's events
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
