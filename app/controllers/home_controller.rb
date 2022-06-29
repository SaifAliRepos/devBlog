# frozen_string_literal: true

# for show page
class HomeController < ApplicationController
  def index
    @posts = Post.all
  end
end
