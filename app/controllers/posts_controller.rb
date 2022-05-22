#require 'will_paginate'
#require 'will_paginate/array'
class PostsController < ApplicationController
  before_action :set_post, only: %i[show edit update destroy]


  def approve
  end

  def report
    if user_signed_in?
      # @post = Post.find(3) # place custom id here and it will report
      # UserMailer.with(post: @post).report_email.deliver_now
    end
  end

  # GET /posts or /posts.json
  def index
    @currentUser = current_user.id
    @posts = if current_user.id == 3
               Post.all
             else
               Post.where(user_id: current_user.id)
             end
  end

  def index2
    @posts = Post.published_post
  end

  # GET /posts/1 or /posts/1.json
  def show
    #@post = Post.find(params[:id])
    #@suggestion = @post.suggestions.build
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit; end

  # POST /posts or /posts.json
  def create
    @post = Post.new(post_params.merge(user_id: current_user.id))

    respond_to do |format|
      if @post.save
        format.html { redirect_to post_url(@post), notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1 or /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to post_url(@post), notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1 or /posts/1.json
  def destroy
    @post.destroy

    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_post
    @post = Post.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def post_params
    params.require(:post).permit(:name, :title, :status, :image)
  end

  def p_params
    params.require(:post).permit(:title)
  end

  def find_suggestion
    # @post = Post.find_by(id: params[:post_id])
    # @suggestion = @post.suggestions.find(3)
  end
end
