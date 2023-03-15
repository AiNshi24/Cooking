class Recipe < ApplicationRecord
  belongs_to :user
  has_many :ingredlents, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :book_marks, dependent: :destroy
  has_many :tag_relationships, dependent: :destroy
  has_many :tags, through: :tag_relationships
  
  has_one_attached :image
  
  def favorited_by?(user)
    book_marks.exists?(user_id: user.id)
  end
end
