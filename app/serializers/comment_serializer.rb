class CommentSerializer < ActiveModel::Serializer
  attributes :id, :cmnt, :post_id
end
