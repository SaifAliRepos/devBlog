class SuggestionsController < ApplicationController
  before_action :set_suggestion, only: %i[approve show edit update destroy]
  # before_action :set_post_suggestion_params, only: %i[update destroy]
  # GET /suggestions or /suggestions.json

  def approve
    # @post.update(title: @post.title.gsub("in", "is"))

    #@post = Post.find_by(params[:post_id])
    #@suggestion = Suggestion.find_by(params[:suggestion_id])
    @post.update(title: @post.title.gsub(@suggestion.find.to_s, @suggestion.replace.to_s))
    redirect_to post_path(@post)
  end

  def index
    @suggestions = Suggestion.all
  end

  # GET /suggestions/1 or /suggestions/1.json
  def show
  end

  # GET /suggestions/new
  def new
    @suggestion = Suggestion.new
  end

  # GET /suggestions/1/edit
  def edit
    #@suggestion = Suggestion.find(params[:id])
  end

  # POST /suggestions or /suggestions.json
  def create
    @post = Post.find(params[:post_id])
    @suggestion = @post.suggestions.create(suggestion_params.merge(user_id: current_user.id))

    # @post.title.gsub('Third', '3')

    respond_to do |format|
      if @suggestion.save
        format.html { redirect_to post_path(@post), notice: 'Suggestion was successfully created.' }
        format.json { render :show, status: :created, location: @suggestion }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @suggestion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /suggestions/1 or /suggestions/1.json
  def update

    respond_to do |format|
      if @suggestion.update(suggestion_params)
        format.html { redirect_to post_path(@post), notice: 'Suggestion was successfully updated.' }
        format.json { render :show, status: :ok, location: @suggestion }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @suggestion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /suggestions/1 or /suggestions/1.json
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

  # Use callbacks to share common setup or constraints between actions.
  def set_suggestion
    @post = Post.find(params[:post_id])
    @suggestion = Suggestion.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def suggestion_params
    params.require(:suggestion).permit(:post_id, :find, :replace)
  end
end
