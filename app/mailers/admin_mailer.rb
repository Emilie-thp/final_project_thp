class AdminMailer < ApplicationMailer

  default from: 'no-reply@oeil-de-biche.fr'

  def welcome_email(admin)
    @admin = admin
    @url = 'http://oeil-de-biche.fr/'
    mail(to: @admin.email, subject: "Création d'un compte administrateur")
  end

  def contact_email(contact)
    @contact = contact
    @url = 'http://oeil-de-biche.fr/'
    mail(to: 'bamby.boutique.thp@gmail.com', subject: "Nouveau message sur votre site")
  end

end
