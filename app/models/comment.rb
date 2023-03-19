class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :recipe
  
  has_one_attached :image
  
  validates :comment, presence: true, length: { maximum: 100 }
end
