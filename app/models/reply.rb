# frozen_string_literal: true

class Reply < ApplicationRecord
  belongs_to :replyable, polymorphic: true
end
