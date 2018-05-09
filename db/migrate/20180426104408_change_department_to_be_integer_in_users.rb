class ChangeDepartmentToBeIntegerInUsers < ActiveRecord::Migration[5.1]
  def change
    change_column :users, :department, 'integer USING CAST(department AS integer)'
    #Ex:- change_column("admin_users", "email", :string, :limit =>25)
  end
end
