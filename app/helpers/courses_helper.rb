module CoursesHelper
  def enrolled (c)
    c.users.where(user_type: 0)
  end

  def assignment_status?(r, u)
    r.assignments.where(user_id: u.id).first.status
  end

  def how_much_completed?(c, u)
    completed = c.requirements.select do |r|
      assignment_status?(r, u) 
    end

    completed.count
  end

  def is_certified? (c, s)
    how_much_completed?(c, s) == c.requirements.count ? true
    : false
  end

  def certified (c, e)
    certified_students = e.select do |s|
      is_certified?(c, s)
    end

    certified_students
  end

  def course_status(c)
    c.closing_date > Date.today ? "ongoing"
    : c.end_date > Date.today ? "finished"
    : "closed"
  end

  def is_full? (e, c)
    e.count >= c.capacity ? true
    : false
  end
end
