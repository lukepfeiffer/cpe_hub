class CreateProfessorCourses < ActiveRecord::Migration
  def change
    create_table :professor_courses do |t|
      t.integer :course_id
      t.integer :professor_id
      t.timestamps
    end
  end
end
