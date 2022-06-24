class Reply < ApplicationRecord
  #belongs_to :replyable, polymorphic: true
  belongs_to :comment

end
