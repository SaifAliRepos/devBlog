# frozen_string_literal: true

# likes
class Api::V1::LikesController < ApplicationController

  def index
    @likeable = find_likeable
    @likes = @likeable.likes.all
    render json: @likes
  end

  def new
    @like = @likeable.likes.new
  end

  def create
    @likeable = find_likeable
    @like = @likeable.likes.create(user_id: 1)
    if @like.save
      render json: @like, status: :created
      puts "Like has been saved"
    else
      render json: @like.errors, status: :unprocessable_entity
      puts @like.errors.messages
    end
  end

  private

  def find_likeable
    if params[:comment_id]
      Comment.find params[:comment_id]
    else
      Post.find params[:post_id]
    end
  end
end
