class Article < ApplicationRecord

  validates :title, presence: {message: "Merci d'indiquer le titre de l'article."}, length: {minimum: 2, message: "Le titre doit faire plus de 2 caractères."}
  validates :description, presence: {message: "Merci d'indiquer la description de l'article."}, length: {maximum: 200, message: "La description doit faire moins de 200 caractères maximum."}
  validates :content, presence: {message: "Merci d'indiquer le contenu de l'article."}

  belongs_to :admin
  has_many :article_categories
  has_many :categories, through: :article_categories
  has_one_attached :image

end
