class Admin < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :pseudo, presence: {message: ": merci d'indiquer un pseudo pour une expérience adminsitrateur complète ;)"}

  has_many :projects
  has_many :articles
  has_many :events
  has_one_attached :avatar

  
  after_create :welcome_send
  
  def welcome_send
    AdminMailer.welcome_email(self).deliver_now
  end

end
