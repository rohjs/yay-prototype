module ApplicationHelper
  def is_teacher?(user)
    if user.user_type == 1
      true
    else
      false
    end
  end

  def is_student?(user)
    if user.user_type == 0
      true
    else
      false
    end
  end

  def teachers
    User.where(user_type: 1)
  end

  def students
    User.where(user_type: 0)
  end
end
