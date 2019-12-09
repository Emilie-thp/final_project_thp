class Project < ApplicationRecord

  validates :title, presence: true, length: { minimum: 2 }
  validates :description, presence: true, length: { maximum: 200 }
  validates :content, presence: true
  
  belongs_to :admin
	has_many :project_categories
  has_many :categories, through: :project_categories
  has_one_attached :thumbnail
  has_many_attached :pictures
    
end
