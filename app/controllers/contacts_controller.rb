class ContactsController < ApplicationController

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
      if @contact.save
        flash[:notice] = "Votre message a bien été envoyé"
        redirect_to new_contact_path
      else
        render new_contact_path
      end
  end


  private

    def contact_params
      params.require(:contact).permit(:email, :name, :status, :content, :subject)
    end

end
