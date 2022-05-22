class LikecsController < ApplicationController
  before_action :find_post
 def create
   @comment.likecs.create(post_id: @post.id, user_id: 1, comment_id: @comment.id)
   redirect_to post_path(@post)
 end
 private
 def find_post
   @post = Post.find_by(id: params[:post_id])
   @comment = @post.comments.find_by(id: params[:comment_id])
 end
end
