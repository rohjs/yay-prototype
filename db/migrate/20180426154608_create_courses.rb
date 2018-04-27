class CreateCourses < ActiveRecord::Migration[5.1]
  def change
    create_table :courses do |t|
      t.string :title
      t.text :description
      t.integer :category
      t.integer :level
      t.integer :credit
      t.integer :capacity
      t.datetime :start_date
      t.datetime :end_date
      t.datetime :closing_date

      t.timestamps
    end
  end
end