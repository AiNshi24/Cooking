class Procedure < ApplicationRecord
  belongs_to :recipe
  
  validates :description, presence: true
  
end
