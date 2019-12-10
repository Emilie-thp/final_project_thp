class Article < ApplicationRecord

    validates :title, presence: true, length: { minimum: 2 }
    validates :description, presence: true, length: { maximum: 200 }
    validates :content, presence: true

    belongs_to :admin
 		has_many :article_categories
    has_many :categories, through: :article_categories
    has_one_attached :image

end
