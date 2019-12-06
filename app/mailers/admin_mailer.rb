class AdminMailer < ApplicationMailer

  default from: 'no-reply@oeil-de-biche.fr'
 
  def welcome_email(admin)
    @admin = admin 
    @url  = 'http://oeil-de-biche.fr/' 
    mail(to: @admin.email, subject: "Création d'un compte administrateur") 
  end

  def contact_email(admin)
    @admin = admin
    @url  = 'http://oeil-de-biche.fr/' 
    mail(to: @admin.email, subject: "Demande d'utilisateur")
  end


end
