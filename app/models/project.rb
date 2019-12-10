class Project < ApplicationRecord

  validates :title, presence: {message: "Merci d'indiquer le titre de la réalisation"}, length: { minimum: 2, message: "Le titre doit avoir au moins 2 caractères" }
  validates :description, presence: {message: "Merci d'indiquer la description de la réalisation"}, length: { maximum: 200, message: "La description doit avoir 200 caractères maximum" }
  validates :content, presence: {message: "Merci d'indiquer le contenu de la réalisation"}
  
  belongs_to :admin
	has_many :project_categories
  has_many :categories, through: :project_categories
  has_one_attached :thumbnail
  has_many_attached :pictures
    
end
