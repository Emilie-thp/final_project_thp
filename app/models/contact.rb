class Contact < ApplicationRecord
    validates :email, presence: true, format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, message: "Merci d'indiquer une adresse email valide" }
    validates :name, presence: { message: "Merci d'indiquer votre Prénom et nom sont obligatoires" }
    validates :subject, presence: { message: "Merci d'indiquer l'objet de la demande" }
    validates :content, presence: { message: "Merci d'indiquer le message de la demande" }
    after_create :contact_request

    def contact_request
        AdminMailer.contact_email(self).deliver_now
    end
end
    