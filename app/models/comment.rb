# frozen_string_literal: true

class Comment < ApplicationRecord
  belongs_to :post
  has_many :likes, as: :likeable, dependent: :destroy
  has_many_attached :images, dependent: :destroy
  has_many :replies, as: :replyable
end
