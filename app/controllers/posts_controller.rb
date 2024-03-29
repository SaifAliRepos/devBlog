# frozen_string_literal: true

# require 'will_paginate'
# require 'will_paginate/array'

# posts
class PostsController < ApplicationController
  # skip_before_action :verify_authenticity_token
  before_action :set_post, only: %i[approve report show edit update destroy]
  before_action :set_suggestion, only: %i[approve]

  def approve
    @post.update(title: @post.title.gsub(@suggestion.find.to_s, @suggestion.replace.to_s))

    redirect_to post_path(@post)
  end

  def report
    return unless user_signed_in?

    UserMailer.with(post: @post).report_email.deliver_now if user_signed_in?
  end

  # GET /posts or /posts.json
  def index
    @posts = if current_user.role == 'admin' || current_user.role == 'moderator'
               Post.not_publish_post.order(created_at: :desc)
             else
               Post.not_publish_post.where(user_id: current_user).order(created_at: :desc)
             end
  end

  def dashboard
    @posts = Post.published_post.order(created_at: :desc)
  end

  def show
    authorize @post
  end

  def new
    @post = Post.new
  end

  def edit; end

  def create
    @post = Post.new(post_params.merge(user_id: current_user.id))
    respond_to do |format|
      if @post.save
        format.html { redirect_to post_url(@post), notice: 'Post was successfully created.' }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to post_url(@post), notice: 'Post was successfully updated.' }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @post.destroy

    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
    end
  end

  def error; end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:name, :title, :status, :image)
  end

  def p_params
    params.require(:post).permit(:title)
  end

  def set_suggestion
    @suggestion = Suggestion.find(params[:id])
  end
end
