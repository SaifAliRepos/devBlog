# frozen_string_literal: true

# for dashboard page
class HomeController < ApplicationController
  def index
    @posts = Post.all
  end
end
