class ChangeDepartmentToBeIntegerInUsers < ActiveRecord::Migration[5.1]
  def change
    change_column :users, :department, :integer
    #Ex:- change_column("admin_users", "email", :string, :limit =>25)
  end
end
