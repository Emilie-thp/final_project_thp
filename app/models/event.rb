class Event < ApplicationRecord

  validates :title, presence: true, length: { minimum: 2 }
  validates :description, presence: true, length: { maximum: 200 }
  validates :content, presence: true
  
      belongs_to :admin

end
