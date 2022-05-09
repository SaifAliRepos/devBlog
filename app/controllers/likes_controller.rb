class LikesController < ApplicationController
  before_action :find_post
  def create
    @post.likes.create(user_id: current_user.id)
    #@comment.likes.create(user_id: current_user.id, likeable_type: 'Comment', likeable_id: 1 )
    #@comment = @post.comments.likes.create(post_id: '1')
    redirect_to post_path(@post)
  end

  private
  def find_post
    @post = Post.find(params[:post_id])
    #@comment = Comment.find(params[:comment_id])
    #@comment = @post.comments.find(1)
  end
end
