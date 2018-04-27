class AddTeacherIdToCourses < ActiveRecord::Migration[5.1]
  def change
    add_reference :courses, :teacher, foreign_key: true
  end
end
