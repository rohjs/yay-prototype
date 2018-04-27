class RemoveTeacherFromCourses < ActiveRecord::Migration[5.1]
  def change
    remove_column :courses, :teacher_id, :integer
  end
end
