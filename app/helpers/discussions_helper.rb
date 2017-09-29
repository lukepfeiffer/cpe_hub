module DiscussionsHelper
  def get_user_id(current_user)
    if current_user.present?
      current_user.id
    else
      nil
    end
  end
end
