class ContactsController < ApplicationController

    def index
        @contacts = Contact.all
    end

    def create
        @contact = Contact.create(contact_params)

    end

    private

    def contact_params

    params.require(:contact).permit(:email, :name, :status, :content, :subject)

    end

end
