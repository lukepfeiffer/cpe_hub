class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :course_type
      t.string :name
      t.string :course_code
      t.text :description
      t.integer :difficulty
      t.timestamps
    end
  end
end
