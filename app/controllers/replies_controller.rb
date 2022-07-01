# frozen_string_literal: true

# replies
class RepliesController < ApplicationController
  before_action :set_reply, only: %i[show edit update destroy]

  def index
    @replies = Reply.all
  end

  def show; end

  def new
    @reply = @replyable.replies.new
  end

  def edit; end

  def create
    @replyable = find_replyable
    @reply = @replyable.replies.new reply_params
    respond_to do |format|
      if @reply.save
        if params[:suggestion_id]
          format.html do
            redirect_to post_suggestion_path(@replyable.post, @replyable), notice: 'Reply was successfully created.'
          end
        else
          format.html do
            redirect_to post_comment_path(@replyable.post, @replyable), notice: 'Reply was successfully created.'
          end
        end
        format.json { render :show, status: :created, location: @reply }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @reply.update(reply_params)
        format.html { redirect_to reply_url(@reply), notice: 'Reply was successfully updated.' }
        format.json { render :show, status: :ok, location: @reply }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @reply.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @reply.destroy

    respond_to do |format|
      format.html { redirect_to replies_url, notice: 'Reply was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_reply
    @reply = Reply.find(params[:id])
  end

  def reply_params
    params.require(:reply).permit(:reply)
  end

  def find_replyable
    if params[:suggestion_id]
      Suggestion.find params[:suggestion_id]
    else
      Comment.find params[:comment_id]
    end
  end
end
