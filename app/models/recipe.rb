class Recipe < ApplicationRecord
  belongs_to :user
  
  # 材料・作り方
  has_many :ingredients, dependent: :destroy
  accepts_nested_attributes_for :ingredients, allow_destroy: true
  has_many :procedures, dependent: :destroy
  accepts_nested_attributes_for :procedures, allow_destroy: true
  
  has_many :comments, dependent: :destroy
  has_many :book_marks, dependent: :destroy
  has_many :tag_relationships, dependent: :destroy
  has_many :tags, through: :tag_relationships
  
  has_one_attached :image
  
  def get_image
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.png')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image
  end
  
  validates :title, presence: true, length: { maximum: 50}
  
  validate :require_any_ingredients
  validate :require_any_procedures

  def require_any_ingredients
    errors.add(:base, "材料は1つ以上登録してください。") if self.ingredients.blank?
  end

  def require_any_procedures
    errors.add(:base, "作り方は1つ以上登録してください。") if self.procedures.blank?
  end
  
  def favorited_by?(user)
    book_marks.exists?(user_id: user.id)
  end
end
