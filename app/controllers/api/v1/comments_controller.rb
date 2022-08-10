# frozen_string_literal: true

# comment
class Api::V1::CommentsController < ApplicationController
  before_action :set_comment, only: %i[report show update destroy]
  before_action :set_post, only: %i[create index]

  def report
    UserMailer.with(comment: @comment).report_comment.deliver_now
    render json: @comment
  end

  def index
    @comments = @post.comments.all
    render json: @comments
  end

  def show
    render json: @comment
  end

  def new
    @comment = @post.comments.new
  end

  def create
    @comment = @post.comments.create(comment_params)
    if @comment.save
      render json: @comment, status: :created
      puts "Comment has been saved"
    else
      render json: @comment.errors, status: :unprocessable_entity
      puts @comment.errors.messages
    end
  end

  def update
    if @comment.update(comment_params)
      render json: @comment
    else
      render json: @comment.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @comment = @post.comments.find(params[:id])
    if @comment.destroy
      puts "Post deleted successfully"
    else
      render json: @comment.errors, status: :unprocessable_entity
    end
  end

  private

  def set_comment
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:id])
  end

  def set_post
    @post = Post.find params[:post_id]
  end

  def comment_params
    params.require(:comment).permit(:post_id, :cmnt)
  end
end
