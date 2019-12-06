module Dashboard

  class ContactsController < ApplicationController
 		layout 'dashboard'
    before_action :authenticate_admin!

    def index
      @contacts = Contact.all
    end

    def show
      @contact = Contact.find(params[:id])
    end

  end

end
