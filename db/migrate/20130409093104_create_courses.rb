class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :name
      t.string :institute
      t.string :catalog_number
      t.integer :ec
      t.string :staff
      t.string :maximum
      t.string :blok
      t.string :programme
      t.text :description

      t.timestamps
    end
  end
end
