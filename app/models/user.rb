class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :name, presence: true
  validates :introduction, length: { maximum: 100 }

  has_many :recipes, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :book_marks, dependent: :destroy
  has_many :food_stocks, dependent: :destroy

  has_one_attached :profile_image

  def get_profile_image(width,height)
    unless profile_image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      profile_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    profile_image.variant(resize_to_limit: [width,height]).processed
  end

  # is_deletedがfalseならtrueを返す
  # def active_for_authentication?
  #   super && (is_deleted == false)
  # end

end
