class Admin < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :pseudo, presence: {message: ": merci d'indiquer un pseudo pour une expérience adminsitrateur complète ;)"}
  validates :password, presence: {message: "Merci d'indiquer un mot de passe"}, length: { minimum: 6, message: "Merci de choisir un mot de passe d'au moins 6 caractères" }


  has_many :projects
  has_many :articles
  has_many :events
  has_one_attached :avatar

  
  after_create :welcome_send
  
  def welcome_send
    AdminMailer.welcome_email(self).deliver_now
  end

end
