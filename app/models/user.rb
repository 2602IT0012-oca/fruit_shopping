class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :orders
  has_one_attached :photo
  def thumbnail
    photo.variant(resize_to_fit: [200, 200]).processed
  end
  devise :database_authenticatable, :registerable,
         :trackable, :rememberable, :validatable
end
