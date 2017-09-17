require 'rails_helper'

describe Course do
  describe "Valid course codes" do
    before(:each) do
      @course = Course.new(description: "Bar", name: "Foo", difficulty: 1, course_type: "Tech Elective")
    end

    context "Course code has first three as letters" do
      it 'returns no error' do
        @course.course_code = "AAA1111"
        expect(@course.save).to be true
      end
    end

    context "Course code does not have first three as letters" do
      it 'returns an error' do
        @course.course_code = "A2A1111"
        expect(@course.save).to be false
      end
    end

    context "Course code has last four letters as ints" do
      it 'returns no error' do
        @course.course_code = "AAA1111"
        expect(@course.save).to be true
      end
    end

    context "Course code does not have last four letters as ints" do
      it 'returns an error' do
        @course.course_code = "AAA1B11"
        expect(@course.save).to be true
      end
    end

    context "Course code is too long" do
      it "returns an error" do
        @course.course_code = "AAA1111222"
        expect(@course.save).to be false
      end
    end

    context "Course code is not too long" do
      it "returns no error" do
        @course.course_code = "AAA1111"
        expect(@course.save).to be true
      end
    end
  end
end
