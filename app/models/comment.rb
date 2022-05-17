class Comment < ApplicationRecord
  belongs_to :post
  #belongs_to  :parent, class_name: 'Comment', optional: true
  #has_many    :replies, class_name: 'Comment', foreign_key: :parent_id, dependent: :destroy
  has_many :likes, as: :likeable, dependent: :destroy
  has_many :likecs, dependent: :destroy
  has_many_attached :images, dependent: :destroy

end
