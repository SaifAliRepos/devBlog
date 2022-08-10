class PostSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes :id, :name, :title, :image_url

  def image_url
    object.image.url if object.image.attachment
    # if object.image.attached?
    #   {
    #     cloudinary: object.image.service_url
    #  }
    # end
    # return rails_blob_path(object.image, only_path: true)
    # rails_blob_path(object.image , only_path: true) if object.image.attachment
  end
end
