# frozen_string_literal: true

# likes
class LikesController < ApplicationController
  before_action :find_post

  def new
    @like = @likeable.likes.new
  end

  def create
    @likeable = find_likeable
    @like = @likeable.likes.create(user_id: current_user.id)
    respond_to do |format|
      if @like.save
        format.html { redirect_to post_path(@post), notice: 'Post was successfully created.' }
      else
        format.html { redirect_to post_path(@post), status: :unprocessable_entity }
      end
    end
  end

  private

  def find_post
    @post = Post.find(params[:post_id])
  end

  def find_likeable
    if params[:comment_id]
      Comment.find params[:comment_id]
    else
      Post.find params[:post_id]
    end
  end
end
