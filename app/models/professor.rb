class Professor < ActiveRecord::Base
  has_many :courses, through: :professor_courses
end
