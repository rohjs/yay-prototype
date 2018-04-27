class CreateAssignments < ActiveRecord::Migration[5.1]
  def change
    create_table :assignments do |t|
      t.references :user, foreign_key: true
      t.references :requirement, foreign_key: true
      t.boolean :status, default: false

      t.timestamps
    end
  end
end
