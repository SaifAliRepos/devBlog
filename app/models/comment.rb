class Comment < ApplicationRecord
  belongs_to :post
  has_many :likecs, dependent: :destroy
end
