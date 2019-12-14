class Admin < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :pseudo, presence: {message: "Merci d'indiquer un pseudo."}, length: {minimum: 2}

  has_many :projects, dependent: :delete_all
  has_many :articles, dependent: :delete_all
  has_many :events, dependent: :delete_all
  has_one_attached :avatar, dependent: :delete_all

  after_create :welcome_send

  def welcome_send
    AdminMailer.welcome_email(self).deliver_now
  end

end
