class AddUserToTeachers < ActiveRecord::Migration[5.1]
  def change
    add_reference :teachers, :user, foreign_key: true
  end
end
