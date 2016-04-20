class AddColumnToStudents < ActiveRecord::Migration
  def change
    add_column :students, :major, :string, null: false
    add_column :students, :favorite_restaurant, :string
    add_column :students, :worst_campus_food, :string
    add_column :students, :sketchiest_moment, :string
    add_column :students, :biggest_misconception, :string
  end
end
