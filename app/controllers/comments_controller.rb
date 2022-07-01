# frozen_string_literal: true

# comment
class CommentsController < ApplicationController
  before_action :set_comment, only: %i[report show edit update destroy]
  before_action :set_post, only: %i[create]

  def report
    return unless user_signed_in?

    UserMailer.with(comment: @comment).report_comment.deliver_now
  end

  def index
    @comments = Comment.all
  end

  def show; end

  def new
    @comment = Comment.new
  end

  def edit
    @post = Post.find(params[:post_id])
  end

  def create
    @comment = @post.comments.create(comment_params)

    respond_to do |format|
      if @comment.save
        format.html { redirect_to post_path(@post), notice: 'Comment was successfully created.' }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to post_path(@post), notice: 'Comment was successfully updated.' }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @comment = @post.comments.find(params[:id])
    @comment.destroy

    respond_to do |format|
      format.html { redirect_to post_path(@post), notice: 'Comment was successfully destroyed.' }
    end
  end

  private

  def set_comment
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:id])
  end

  def set_post
    @post = Post.find(params[:post_id])
  end

  def comment_params
    params.require(:comment).permit(:post_id, :cmnt, images: [])
  end
end
