class Admin < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :projects
  has_many :articles
  
  after_create :welcome_send


  def welcome_send
    AdminMailer.welcome_email(self).deliver_now
  end

end
