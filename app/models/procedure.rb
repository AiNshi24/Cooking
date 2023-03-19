class Procedure < ApplicationRecord
  belongs_to :recipe
  
  validates :description, presence: true
  
  has_one_attached :image
end
