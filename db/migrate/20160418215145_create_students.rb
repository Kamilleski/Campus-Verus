class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.belongs_to :school, null: false

      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :photo_url, null: false
      t.string :interests, null: false
      t.string :year_in_college, null: false
      t.string :living_situation, null: false
      t.string :hometown, null:false

      t.timestamps
    end
  end
end
