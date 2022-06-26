module ApplicationHelper
  def eligible_user(post, current_user)
    @post.user_id == current_user.id || current_user.id == 1 || current_user.id == 2
  end
end
