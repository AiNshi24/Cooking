class Ingredient < ApplicationRecord
  belongs_to :recipe
  
  # 材料・分量指定のバリデーション
  validates :content, presence: true
  validates :quantity, presence: true
  
  # 検索機能
  def self.ransackable_attributes(auth_object = nil)
    ["content"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["recipe"]
  end

end

