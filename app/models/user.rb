class User < ApplicationRecord

  has_many :posts
  has_many :likes, dependent: :destroy
  has_many :likecs, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :confirmable, :registerable,
         :recoverable, :rememberable, :validatable, :lockable
end
