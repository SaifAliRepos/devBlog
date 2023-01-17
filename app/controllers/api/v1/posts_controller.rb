# frozen_string_literal: true

# posts
class Api::V1::PostsController < ApplicationController
  before_action :set_post, only: %i[approve report show update destroy]

  def report
    UserMailer.with(post: @post).report_email.deliver_now
    render json: @post
  end

  def index
    @posts = Post.all
    render json: @posts, include: [:image_url]
  end

  def dashboard
    @posts = Post.published_post.order(created_at: :desc)
    render json: @posts
  end

  def show
    render json: @post
  end

  def create
    @post = Post.new(post_params.merge(user_id: 1))
    if @post.save
      render json: @post, status: :created, location: @post
      puts "Post has been saved!"
    else
      render json: @post.errors, status: :unprocessable_entity
      puts @post.errors.messages
    end
  end

  def update
    if @post.update(post_params)
      render json: @post
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  def destroy
    if @post.destroy
      puts "Post deleted successfully"
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:name, :title, :status, :image)
  end

end
