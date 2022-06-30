# frozen_string_literal: true

# post
class PostPolicy < ApplicationPolicy
  def index; end

  def create?; end

  def show?
    true if user.role == 'admin' || user.role == 'moderator' || user.id == post.user_id || post.status == 'publish'
  end

  def edit?; end

  def update?; end

  def destroy?; end

  def approve?
    return true if user.id == post.user_id
  end
end
