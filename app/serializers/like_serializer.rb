class LikeSerializer < ActiveModel::Serializer
  attributes :id, :likeable_id, :likeable_type
end