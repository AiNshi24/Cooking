class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_many :recipes, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :book_marks, dependent: :destroy
  has_many :food_stocks, dependent: :destroy
end
