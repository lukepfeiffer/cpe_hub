class Professor < ActiveRecord::Base
  has_many :courses, through: :professor_courses

  def full_name
    "#{title} #{last_name}, #{first_name}"
  end
end
