module Dashboard

  class ContactsController < ApplicationController
    before_action :authenticate_admin!

    def index
      @contacts = Contact.all.order('created_at DESC')
    end

    def show
      @contact = Contact.find(params[:id])
    end

  end

end
