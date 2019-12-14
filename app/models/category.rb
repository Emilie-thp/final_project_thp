class Category < ApplicationRecord

  validates :category_name, presence: {message: "Merci d'indiquer un titre à la catégorie."}

  has_many :project_categories
  has_many :projects, through: :project_categories

end
