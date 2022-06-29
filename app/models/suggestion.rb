# frozen_string_literal: true

class Suggestion < ApplicationRecord
  belongs_to :post
  belongs_to :user
  has_many :replies, as: :replyable
end
