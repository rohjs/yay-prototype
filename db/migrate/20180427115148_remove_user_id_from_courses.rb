class RemoveUserIdFromCourses < ActiveRecord::Migration[5.1]
  def change
    remove_reference :courses, :user, foreign_key: true
  end
end
