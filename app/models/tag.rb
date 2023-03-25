class Tag < ApplicationRecord
  has_many :tag_relationships, dependent: :destroy
  has_many :recipes, through: :tag_relationships
end
