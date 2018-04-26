class AddColsToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :name, :string
    add_column :users, :user_type, :integer
    add_column :users, :phone_number, :string
    add_column :users, :department, :string
  end
end
