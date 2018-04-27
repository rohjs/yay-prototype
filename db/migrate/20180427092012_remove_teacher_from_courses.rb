class RemoveTeacherFromCourses < ActiveRecord::Migration[5.1]
  def change
    if column_exists? :courses, :teacher_id
      remove_reference :courses, :teacher_id
    end
  end
end
