class CreateSchools < ActiveRecord::Migration
  def change
    create_table :schools do |t|
      t.string :name, null: false
      t.string :nickname, null: false
      t.string :city, null: false
      t.string :state, null: false
      t.string :motto, null: false
      t.string :email_domain, null: false
      t.integer :undergrad_population, null: false
      t.integer :graduate_population, null: false
      t.boolean :public, null: false
      t.string :logo, null: false
      t.string :mascot, null: false
      t.integer :date_founded, null: false

      t.timestamps
    end
  end
end
