class RemoveUserFromStudents < ActiveRecord::Migration[5.1]
  def change
    remove_column :students, :user_id, :integer
  end
end
