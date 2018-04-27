class RemoveUserFromTeachers < ActiveRecord::Migration[5.1]
  def change
    remove_column :teachers, :user_id, :integer
  end
end
