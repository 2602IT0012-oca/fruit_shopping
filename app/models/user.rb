class User < ApplicationRecord
    validates :name, presence: true, length: { minimum: 2 }, uniqueness: true
    validates :age, presence: true, length: { maximum: 3 }, numericality: { only_integer: true }
    validates :password, presence: true, length: { in: 6..20 }, confirmation: true
    validates :password_confirmation, presence: true
    validates :email, uniqueness: true
    # Include default devise modules. Others available are:
    # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
    devise :database_authenticatable, :registerable,
    :trackable, :rememberable, :validatable
end