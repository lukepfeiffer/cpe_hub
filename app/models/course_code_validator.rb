class CourseCodeValidator
  MAX_LENGTH = 7
  MAX_LETTER_INDEX = 2
  MIN_NUM_INDEX = 3

  def self.too_long?(course_code)
    course_code.length > MAX_LENGTH
  end

  def self.first_three_valid?(course_code)
    valid = true

    3.times do |n|
      if StringHelper.is_letter?(course_code[n])
        valid = true
      else
        valid = false
        break
      end
    end

    valid
  end

  def self.last_four_valid?(course_code)
    n = MIN_NUM_INDEX
    valid = true

    4.times do
      if StringHelper.is_num?(course_code[n])
        valid = true
      else
        valid = false
        break
      end

      ++n
    end

    valid
  end
end
