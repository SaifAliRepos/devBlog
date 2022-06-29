# frozen_string_literal: true

class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :suggestions, dependent: :destroy
  has_many :likes, as: :likeable, dependent: :destroy
  has_one_attached :image, dependent: :destroy

  scope :published_post, -> { where(status: 'publish') }
  scope :pending_post, -> { where(status: 'pending') }
  scope :unpublish_post, -> { where(status: 'unpublish') }
  scope :not_publish_post, -> { where.not(status: 'publish') }

  enum status:
  {
    pending: 'pending',
    publish: 'publish',
    unpublish: 'unpublish'
  }

end
