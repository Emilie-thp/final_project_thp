class Project < ApplicationRecord
    
    belongs_to :admin
 		has_many :project_categories
    has_many :categories, through: :project_categories
    has_one_attached :image
    has_many_attached :diaporama
    
end
