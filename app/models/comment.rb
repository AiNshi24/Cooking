class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :recipe
  
  has_one_attached :image
  
  def get_image
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.png')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image
  end
  
  validates :comment, presence: true, length: { maximum: 100 }
end
