class Post < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :likes, as: :likeable, dependent: :destroy
  has_many :likecs, dependent: :destroy
end
