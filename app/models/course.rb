class Course < ActiveRecord::Base
  validates_presence_of :course_code, :name, :description
  validate :valid_course_code

  def by_course_code(course_code)
  end

  def valid_course_code
    errors.add(:course_code, "Can not be more than 7 characters!") if CourseCodeValidator.too_long?(course_code)
    errors.add(:course_code, "First three characters must be letters") unless CourseCodeValidator.first_three_valid?(course_code)
    errors.add(:course_code, "Last four characters must be integers") unless CourseCodeValidator.last_four_valid?(course_code)
  end
end
