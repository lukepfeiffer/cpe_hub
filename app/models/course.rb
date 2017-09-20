class Course < ActiveRecord::Base
  has_many :professors, through: :professor_courses

  validates_presence_of :course_code, :name, :description
  validate :valid_course_code

  def self.filter_by_code(course_type=nil)
    letters_array = Course.course_code_letters(course_type).uniq
    letters_array = letters_array.sort_by(&:downcase)
    if course_type.present?
      courses = Course.where(course_type: course_type)
    else
      courses = Course.all
    end

    sorted_courses = []

    letters_array.each do |letters|
      courses_array = []

      courses.each do |course|
        if(course.course_code.include?(letters))
           courses_array << course
           courses = courses.reject{|remove_course| remove_course == course }
        end
      end

      sorted_courses << courses_array
    end

    sorted_courses
  end

  def self.course_code_letters(course_type=nil)
    if course_type.present?
      courses = Course.where(course_type: course_type)
    else
      courses = Course.all
    end

    courses.each_with_object([]) do |course, letters|
      letters << course.course_code[0..2]
    end
  end

  def valid_course_code
    errors.add(:course_code, "Can not be more than 7 characters!") if CourseCodeValidator.too_long?(course_code)
    errors.add(:course_code, "First three characters must be letters") unless CourseCodeValidator.first_three_valid?(course_code)
    errors.add(:course_code, "Last four characters must be integers") unless CourseCodeValidator.last_four_valid?(course_code)
  end
end
