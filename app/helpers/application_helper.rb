module ApplicationHelper
  def admin?
    current_user&.role&.name == 'admin'
  end

  def staff?
    current_user&.role&.name == 'staff'
  end

  def customer?
    current_user&.role&.name == 'customer'
  end

  def user_name
    current_user&.name
  end

  def owner_of?(comment)
    current_user && current_user.id == comment.user_id
  end

end
