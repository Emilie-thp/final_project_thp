class Admin < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :projects
  has_many :articles
  has_many :events
  
  after_create :welcome_send

  has_many :projects
  has_many :articles
  has_many :events

  def welcome_send
    AdminMailer.welcome_email(self).deliver_now
  end

end
