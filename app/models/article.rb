class Article < ApplicationRecord

    belongs_to :admin    
 		has_many :article_categories
    has_many :categories, through: :article_categories
    has_many_attached :pictures
        
end
