class CreateRequirements < ActiveRecord::Migration[5.1]
  def change
    create_table :requirements do |t|
      t.references :course, foreign_key: true
      t.string :title
      t.string :description
      t.boolean :status, default: false

      t.timestamps
    end
  end
end
