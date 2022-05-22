class Post < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :suggestions
  has_many :likes, as: :likeable, dependent: :destroy
  has_many :likecs, dependent: :destroy
  has_one_attached :image, dependent: :destroy

  scope :published_post, -> { where(status: "publish") }
  scope :pending_post, -> { where(status: "pending") }
  scope :unpublish_post, -> { where(status: "unpublish") }

  enum status:
  {
    pending: "pending",
    publish: "publish",
    unpublish: "unpublish"
  }
end
