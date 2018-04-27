class AddUserToStudents < ActiveRecord::Migration[5.1]
  def change
    add_reference :students, :user, foreign_key: true
  end
end
