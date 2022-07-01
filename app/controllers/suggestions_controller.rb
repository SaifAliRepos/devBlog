# frozen_string_literal: true

# suggestions
class SuggestionsController < ApplicationController
  before_action :set_suggestion, only: %i[show edit update destroy]
  before_action :set_approve, only: %i[approve]

  def approve
    @post.update(title: @post.title.gsub(@suggestion.find.to_s, @suggestion.replace.to_s))
    authorize @post
    respond_to do |format|
      if @post.save
        @suggestion.destroy
        format.html { redirect_to post_path(@post), notice: 'Suggestion was successfully updated.' }
      else
        format.html { redirect_to not_found_path, status: :unprocessable_entity }
      end
    end
  end

  def index
    @suggestions = Suggestion.all
  end

  def show; end

  def new
    @suggestion = Suggestion.new
  end

  def edit; end

  def create
    @post = Post.find(params[:post_id])
    @suggestion = @post.suggestions.create(suggestion_params.merge(user_id: current_user.id))
    respond_to do |format|
      if @suggestion.save
        format.html { redirect_to post_path(@post), notice: 'Suggestion was successfully created.' }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @suggestion.update(suggestion_params)
        format.html { redirect_to post_path(@post), notice: 'Suggestion was successfully updated.' }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    @suggestion = @post.suggestions.find(params[:id])
    @suggestion.destroy

    respond_to do |format|
      format.html { redirect_to post_path(@post), notice: 'Suggestion was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_suggestion
    @post = Post.find(params[:post_id])
    @suggestion = Suggestion.find(params[:id])
  end

  def suggestion_params
    params.require(:suggestion).permit(:user_id, :post_id, :find, :replace)
  end

  def set_approve
    @post = Post.find(params[:post_id])
    @suggestion = Suggestion.find(params[:suggestion_id])
  end
end
