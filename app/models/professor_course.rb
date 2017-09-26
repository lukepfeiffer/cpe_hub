class ProfessorCourse < ActiveRecord::Base
  belongs_to :course
  belongs_to :professor
  has_many :professor_courses

  def self.create_join_for_professor(course_ids, professor_id)
    course_ids.each do |course_id|
      ProfessorCourse.create(course_id: course_id, professor_id: professor_id)
    end
  end

  def self.create_join_for_courses(professor_ids, course_id)
    professor_ids.each do |prof_id|
      ProfessorCourse.create(course_id: course_id, professor_id: prof_id)
    end
  end
end
