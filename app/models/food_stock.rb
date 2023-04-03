class FoodStock < ApplicationRecord
  belongs_to :user
  
  validates :name, presence: true, length: { maximum: 20}
  validates :memo, length: { maximum: 100 }
end
