class LikecsController < ApplicationController
  before_action :find_post
 def create
   @comment.likecs.create(post_id: @post, user_id: current_user.id, comment_id: @comment)
   redirect_to post_path(@post)
 end
 private
 def find_post
   @post = Post.find(params[:post_id])
   @comment = @post.comments.find(params[:comment_id])
 end
end
