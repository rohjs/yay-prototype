module CoursesHelper
  def enrolled (c)
    c.users.where(user_type: 0)
  end

  def assignment_status?(r, u)
    r.assignments.where(user_id: u.id).first.status
  end
end
