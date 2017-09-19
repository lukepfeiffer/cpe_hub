class CreateTaughtCourses < ActiveRecord::Migration
  def change
    create_table :taught_courses do |t|
      t.integer :course_id
      t.integer :professor_id
      t.timestamps
    end
  end
end
