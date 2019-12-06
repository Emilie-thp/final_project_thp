class ContactsController < ApplicationController

    def index
        @contacts = Contact.all
    end

    def create
        @contact = Contact.new(contact_params)
        if @contact.save
            redirect_to root_path
        else
            render root_path
            
        end

    end

    private

    def contact_params

    params.require(:contact).permit(:email, :name, :status, :content, :subject)

    end

end
