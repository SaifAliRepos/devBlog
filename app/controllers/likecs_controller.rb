class LikecsController < ApplicationController
  before_action :find_post
 def create
   @comment.likecs.create(post_id: 1, user_id: 1, comment_id: 1)
   redirect_to post_path(@post)
 end
 private
 def find_post
   @post = Post.find(params[:post_id])
   @comment = @post.comments.find(params[:comment_id])
 end
end
